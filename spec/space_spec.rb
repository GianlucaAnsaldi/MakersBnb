require 'space'

describe Spaces do

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
