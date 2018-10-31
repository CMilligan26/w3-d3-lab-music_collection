require_relative('../db/sql_reader')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(param)
    @id = param["id"] if param["id"]
    @name = param["name"]
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)"
    values = [@name]
    SqlRunner.run(sql, values)
  end

end
