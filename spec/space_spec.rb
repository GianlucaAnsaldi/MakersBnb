require 'space'

describe Space do

  describe '.add' do 
    it 'adds a lisitng' do 
      space = Space.add
      expect(space).to be_a (Space)
    end 
  end 

end 
