require 'pg'

class Spaces
  attr_reader :name, :description, :price
  

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
results = connection.exec("SELECT * FROM spaces;")
    results.map do |row|
      Spaces.new(name: row['name'], description: row['description'], price: row['price'])
    end
  end
  
    def self.add(name:, description:, price:)
     if ENV['RACK_ENV'] == 'test'
       connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
      result = connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{name}','#{description}','#{price}') RETURNING name, description, price;")

    Spaces.new(
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price']
    )
    
  end
end
    
