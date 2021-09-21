require 'spaces'

describe Spaces do
  describe '.all' do 
    it 'Can return all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('loft', 'lovely loft', '1000');")

      spaces = Spaces.all[0]
      expect(spaces.name).to eq 'loft'
      expect(spaces.description).to eq 'lovely loft'
      expect(spaces.price).to eq '1000'
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
