require 'request'

describe Request do
  describe '.generate' do
    it 'generates a new booking request' do
      request = Request.generate(space_id: '1')

      expect(request.id).to eq '1'
      expect(request.space_id).to eq '1'
      expect(request.approved).to eq false
    end
  end
end