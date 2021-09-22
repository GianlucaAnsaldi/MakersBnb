require 'pg'

class User
  attr_reader :email, :password
  

  def initialize(email:, password:)
    @email = email
    @password = password
  end
  
  def self.create(email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    raise "PLEASE ENTER A VALID EMAIL ADDRESS!" if @email.exclude?("@")
    raise "DUPLICATE ACCOUNT REQUEST!" if User.duplicate?(email: @email, password: @password)
    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}','#{password}') RETURNING email, password;")

    User.new(
      email: result[0]['email'],
      password: result[0]['password']
    )
  end
  
  def self.login(email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}' LIMIT 1;")
    account = result.map { |account| account }
    raise "NO ACCOUNT FOUND!" if account[0] == nil
    raise "PASSWORD INCORRECT!" if account[0]["password"] != password
  end 

  def self.duplicate?(email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}' LIMIT 1;")
    account = result.map { |account| account }
    account[0] != nil
  end
end
