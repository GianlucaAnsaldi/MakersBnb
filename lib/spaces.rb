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
end