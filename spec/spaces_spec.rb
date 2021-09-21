require 'spaces'

describe Spaces do
  it 'Can return all spaces' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, description, price) VALUES ('loft', 'lovely loft', '1000');")

    spaces = Spaces.all[0]
    expect(spaces.name).to eq 'loft'
    expect(spaces.description).to eq 'lovely loft'
    expect(spaces.price).to eq '1000'
  end
end