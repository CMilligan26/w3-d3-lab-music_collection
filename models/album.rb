require_relative('../db/sql_reader')

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

end
