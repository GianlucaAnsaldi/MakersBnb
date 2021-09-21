require 'spaces'

describe 'spaces' do
  describe '.all' do
    it 'returns all the spaces' do
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
end