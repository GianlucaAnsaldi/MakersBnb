require 'spaces'
require 'user'

describe Spaces do
  describe '.all' do 
    it 'Can return all spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      User.create(email: 'test@example.com', password: 'secret123')
      connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('loft', 'lovely loft', '1000', 1);")
      connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('house', 'lovely house', '2000', 1);")
      connection.exec("INSERT INTO spaces (name, description, price, owner_id) VALUES ('shed', 'lovely shed', '50', 1);")

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
      user = User.create(email: 'test@example.com', password: 'secret123')
      space = Spaces.add(name: 'Loft', description: 'A nice loft', price: 90, owner_id: 1)
      expect(space).to be_a Spaces
    end 

    it 'adds the parameters correctly to the database' do 
      user = User.create(email: 'test@example.com', password: 'secret123')
      space = Spaces.add(name: 'Loft', description: 'A nice loft', price: 90, owner_id: 1)
      expect(space.name).to eq('Loft')
      expect(space.description).to eq('A nice loft')
      expect(space.price).to eq('90')
    end 
  end

  describe '.find' do
    it 'returns the requested spaces object' do
      user = User.create(email: 'test@example.com', password: 'secret123')
      space = Spaces.add(name: 'Loft', description: 'A nice loft', price: 90, owner_id: 1)
      results = Spaces.find(id: space.id)

      expect(results.id).to eq space.id
      expect(results.name).to eq('Loft')
      expect(results.description).to eq('A nice loft')
      expect(results.price).to eq('90')
    end
  end
end
