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

    print account
    raise "PASSWORD INCORRECT!" if account.password != password2
  end 
end
    
