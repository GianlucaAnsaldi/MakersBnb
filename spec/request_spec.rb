require 'request'

describe Request do
  let (:spaces_class) { double :spaces_class }

  describe '.generate' do
    it 'generates a new booking request' do
      allow(spaces_class).to receive(:find).and_return(1)
      p spaces_class.find
      request = Request.generate(space_id: spaces_class.find)

      expect(request.id).to eq '1'
      expect(request.space_id).to eq 1
      expect(request.approved).to eq false
    end
  end
end