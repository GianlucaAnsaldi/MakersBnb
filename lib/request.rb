require 'pg'

class Request

attr_reader :id, :user_id, :space_id, :is_approved

  def initialize(id:, user_id:, space_id:, is_approved:)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @is_approved = is_approved
  end

  def self.generate(user_id:, space_id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (user_id, space_id) VALUES ('#{user_id}', '#{space_id}') RETURNING id, user_id, space_id, is_approved;")

    Request.new(
      id: result[0]['id'],
      user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      is_approved: result[0]['is_approved']
    )
  end
end