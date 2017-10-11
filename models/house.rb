require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :emblem

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @emblem = options['emblem']
  end

  # CRUD

  def save()
    sql = "INSERT INTO houses (name, emblem) VALUES ($1, $2) RETURNING id;"
    values = [@name, @emblem]
    results = SqlRunner.run(sql, "save_house", values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    values = []
    results = SqlRunner.run(sql, "get_houses", values)
    return results.map { |house| House.new(house) }
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, "find_house", values)
    return results.map { |house| House.new(house) }
  end

  def update()
    sql = "UPDATE houses (name, emblem) = ($1, $2) WHERE id = $3;"
    values = [@name, @emblem, @id]
    SqlRunner.run(sql, "update_house", values)
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    values = []
    SqlRunner.run(sql, "delete_houses", values)
  end

  def delete()
    sql = "DELETE FROM houses WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_house", values)
  end

end
