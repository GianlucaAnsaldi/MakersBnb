require 'pg'

class Space
  attr_reader :name, :description, :price
  
  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.add(name:, description:, price:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{name}','#{description}','#{price}') RETURNING name, description, price;")
    
    Space.new(
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price']
    )
    
  end


end