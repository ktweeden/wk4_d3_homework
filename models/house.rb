require_relative '../db/sql_runner'

class House

  attr_reader :name, :logo, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = "
    INSERT INTO houses
    (
      name, logo
    )
    VALUES (
      $1, $2
    )
    RETURNING *;"
    values = [@name, @logo]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def students
    sql = "SELECT * FROM students WHERE house = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map{|student| Student.new(student)}
  end

  def self.find_all
    sql = "SELECT * FROM houses;"
    results = SqlRunner.run(sql)
    results.map{|house| House.new(house)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    values = [id]
    House.new(SqlRunner.run(sql, values).first)
  end

end
