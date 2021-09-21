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
  
end
    
