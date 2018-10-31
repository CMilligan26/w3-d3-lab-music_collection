require_relative('../db/sql_reader')
require_relative('album')

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

  def update
    sql = "UPDATE artists SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql,value)
  end

  def self.list_all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{| artist | Artist.new(artist)}
    return artists
  end

  def list_all_albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    value = [@id]
    result = SqlRunner.run(sql, value)
    all_albums = result.map{| album | Album.new(album)}
    return all_albums
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    artists = result.map{ |artist| Artist.new(artist) }
    return artists
  end

end
