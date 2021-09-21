require 'user'

describe '.create' do 
  it 'stores users information' do
    user = User.create(email: 'email@example.com', password: 'password123')
    expect(user.email).to eq 'email@example.com'
    expect(user.password).to eq 'password123'
  end 
end 
