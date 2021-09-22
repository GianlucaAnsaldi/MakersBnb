require 'requests'

describe Requests do
  describe '#create' do
    it 'Can create a request' do
      request = Requests.create(user_id: 12, space_id: 40000)
      expect(request).to be_a Requests
    end
  end
end
