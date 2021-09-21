require 'spaces'

describe 'spaces' do
  describe '.all' do
    it 'returns all the spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      #spaces = spaces.all
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('loft', 'lovely loft', '1000');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('house', 'lovely house', '2000');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('shed', 'lovely shed', '50');")
      connection.exec("INSERT INTO spaces (name, description, price) VALUES ('tent', 'lovely tent', '5000');")

      #expect(spaces.name, spaces.description, spaces.price).to eq
    end
  end
end