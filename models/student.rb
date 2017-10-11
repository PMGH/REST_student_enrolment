require_relative('../db/sql_runner')
require_relative('house')

class Student

  attr_reader :id, :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  # CRUD

  def save()
    sql = "INSERT INTO students (first_name, second_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@first_name, @second_name, @house_id, @age]
    results = SqlRunner.run(sql, "save_student", values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students;"
    values = []
    results = SqlRunner.run(sql, "get_students", values)
    return results.map { |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, "find_student", values).first()
    return Student.new(results)
  end

  def update()
    sql = "UPDATE students (first_name, second_name, house_id, age) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@first_name, @second_name, @house_id, @age, @id]
    SqlRunner.run(sql, "update_student", values)
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    values = []
    SqlRunner.run(sql, "delete_students", values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_student", values)
  end

  def full_name()
    return "#{@first_name.capitalize()} #{@second_name.capitalize()}"
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1;"
    values = [@house_id]
    results = SqlRunner.run(sql, "get_student_house", values).first()
    return House.new(results)
  end


end
