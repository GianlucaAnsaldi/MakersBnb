require 'request'
require 'spaces'

describe Request do

  describe '.generate' do
    it 'generates a new booking request' do
      user = User.create(email: 'test@example.com', password: 'secret123')
      space = Spaces.add(name:'Place', description:'A nice place', price:'27', owner_id: 1)
      request = Request.generate(user_id: '1', space_id: '1')

      expect(request).to be_a Request
      expect(request.id).to eq '1'
      expect(request.user_id).to eq '1'
      expect(request.space_id).to eq '1'
      expect(request.is_approved).to eq 'f'
    end
  end

  describe '.show_pending' do
    it "show a user's pending requests" do
      user = User.create(email: 'test@example.com', password: 'secret123')
      user2 = User.create(email: 'test2@example.com', password: 'secret456')
      user2 = User.create(email: 'test3@example.com', password: 'secret789')
      space = Spaces.add(name:'Place', description:'A nice place', price:'27', owner_id: 1)
      space = Spaces.add(name:'Flat', description:'An average flat', price:'15', owner_id: 2)
      
      Request.generate(user_id: '2', space_id: '1')
      Request.generate(user_id: '3', space_id: '1')
      Request.generate(user_id: '3', space_id: '2')

      pending_requests = Request.show_pending(user: 1)

      expect(pending_requests.length).to eq 2
      expect(pending_requests.first).to be_a Request
      # expect(pending_requests.first.name).to eq 'loft'
      # expect(spaces.first.description).to eq 'lovely loft'
      # expect(spaces.first.price).to eq '1000'
    end
  end
end