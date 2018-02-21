require_relative '../db/sql_runner'

class Student

  attr_reader :first_name, :last_name, :house

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house'].to_i
  end

  def save
    sql = "INSERT INTO students
    (
      first_name, last_name, house
    )
    VALUES (
      $1, $2, $3
    )
    RETURNING *;"
    values = [@first_name, @last_name, @house]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def house_name
    result = House.find_by_id(@house)
    result.name
  end

  def self.find_all
    sql = "SELECT * FROM students;"
    results = SqlRunner.run(sql)
    results.map{|student| Student.new(student)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    Student.new(SqlRunner.run(sql, values).first)
  end

end
