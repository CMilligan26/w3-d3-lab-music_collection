require_relative('../db/sql_reader')
require_relative('artist')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(param)
    @id = param["id"].to_i if param["id"]
    @title = param["title"]
    @genre = param["genre"]
    @artist_id = param["artist_id"]
  end

  def save
    sql = "INSERT INTO albums
    (title,
    genre,
    artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.list_all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    albums = result.map{| album | Album.new(album)}
    return albums
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [@artist_id]
    result = SqlRunner.run(sql, value)
    artists = result.map{|artist| Artist.new(artist)}
    return artists
  end





end
