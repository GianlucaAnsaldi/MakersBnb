require 'space'

describe Space do

  describe '.add' do 
    it 'adds a listing' do 
      space = Space.add(name: 'Loft', description: 'A nice loft', price: 90)
      expect(space).to be_a Space
      
    end 

    it 'adds the parameters correctly to the database' do 
      space = Space.add(name: 'Loft', description: 'A nice loft', price: 90)
      expect(space.name).to eq('Loft')
      expect(space.description).to eq('A nice loft')
      expect(space.price).to eq('90')
      
    end 
  end 

end 
