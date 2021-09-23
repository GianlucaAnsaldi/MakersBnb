require 'request'
require 'spaces'

describe Request do

  describe '.generate' do
    it 'generates a new booking request' do
      space = Spaces.add(name:'Place', description:'A nice place', price:'27')
      user = User.create(email: 'test@example.com', password: 'secret123')
      request = Request.generate(user_id: '1', space_id: '1')

      expect(request).to be_a Request
      expect(request.id).to eq '1'
      expect(request.user_id).to eq '1'
      expect(request.space_id).to eq '1'
      expect(request.is_approved).to eq 'f'
    end
  end
end