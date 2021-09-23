require 'pg'
require_relative 'dbconnect'

class Request

attr_reader :id, :user_id, :space_id, :is_approved

  def initialize(id:, user_id:, space_id:, is_approved:)
    @id = id
    @user_id = user_id
    @space_id = space_id
    @is_approved = is_approved
  end

  def self.generate(user_id:, space_id:)
    connection = establish_connection()
    result = connection.exec("INSERT INTO requests (user_id, space_id) VALUES ('#{user_id}', '#{space_id}') RETURNING id, user_id, space_id, is_approved;")

    Request.new(
      id: result[0]['id'],
      user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      is_approved: result[0]['is_approved']
    )
  end

  def self.show_pending(user:)
    connection = establish_connection()
    result = connection.exec("SELECT requests.* FROM requests INNER JOIN spaces on requests.space_id=spaces.id WHERE owner_id = '#{user}';")
    result.map do |row|
      Request.new(
        id: row['id'], 
        user_id: row['user_id'], 
        space_id: row['space_id'], 
        is_approved: row['is_approved']
      )
    end
  end
end