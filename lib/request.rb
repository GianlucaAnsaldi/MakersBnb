require 'pg'

class Request

  def initialize(id:, space_id:, approved:)
    @id = id
    @space_id = space_id
    @approved = approved
  end

  def self.generate(space_id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (space_id) VALUES ('#{space_id}') RETURNING id, space_id, is_approved;")

    Request.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      approved: result[0]['approved']
    )
  end
end