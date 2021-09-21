require 'space'

describe Space do

  describe '.add' do 
    it 'adds a listing' do 
      space = Space.add(name: 'Loft', description: 'A nice loft', price: 90)
      expect(space).to be_a Space
      
    end 
  end 

end 
