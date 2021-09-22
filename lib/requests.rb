require 'pg'

class Requests
  def initialize(user_id:, space_id:)
    @user_id = user_id
    @space_id = space_id
  end

  def self.create(user_id:, space_id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (users_id, space_id) VALUES ('#{user_id}','#{space_id}') RETURNING users_id, space_id;")
    Requests.new(
      user_id: result[0]['users_id'],
      space_id: result[0]['space_id']
    )
  end
end