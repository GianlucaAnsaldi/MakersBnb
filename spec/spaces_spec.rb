require 'spaces'

describe Spaces do
  describe '.all' do 
    it 'Can return all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('loft', 'lovely loft', '1000');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('house', 'lovely house', '2000');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('shed', 'lovely shed', '50');")

      spaces = Spaces.all
      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Spaces
      expect(spaces.first.name).to eq 'loft'
      expect(spaces.first.description).to eq 'lovely loft'
      expect(spaces.first.price).to eq '1000'
    end
  end

  describe '.add' do 
    it 'adds a listing' do 
      space = Spaces.add(name: 'Loft', description: 'A nice loft', price: 90)
      expect(space).to be_a Spaces
    end 

    it 'adds the parameters correctly to the database' do 
      space = Spaces.add(name: 'Loft', description: 'A nice loft', price: 90)
      expect(space.name).to eq('Loft')
      expect(space.description).to eq('A nice loft')
      expect(space.price).to eq('90')
    end 
  end
end
