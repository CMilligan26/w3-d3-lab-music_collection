require_relative('../db/sql_reader')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(param)
    @id = param["id"].to_i if param["id"]
    @name = param["name"]
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.list_all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{| artist | Artist.new(artist)}
    return artists
  end

end
