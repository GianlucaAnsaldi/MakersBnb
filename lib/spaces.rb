require 'pg'
require 'dbconnect'

class Spaces
  attr_reader :id, :name, :description, :price, :owner_id
  

  def initialize(id:, name:, description:, price:, owner_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @owner_id = owner_id
  end


  def self.all
    connection = establish_connection()
    results = connection.exec("SELECT * FROM spaces;")
    results.map do |row|
      Spaces.new(id: row['id'], name: row['name'], description: row['description'], price: row['price'], owner_id: row['owner_id'])
    end
  end
  
  def self.add(name:, description:, price:, owner_id:)
    connection = establish_connection()
    result = connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{name}','#{description}','#{price}', '#{owner_id}') RETURNING id, name, description, price, owner_id;")

    Spaces.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      owner_id: result[0]['owner_id']
    )
  end

  def self.find(id:)
    connection = establish_connection()
    result = connection.exec("SELECT * FROM spaces WHERE id='#{id}';")

    Spaces.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      owner: result[0]['owner_id']
    )
  end

end
    
