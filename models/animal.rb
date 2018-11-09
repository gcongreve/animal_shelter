require_relative ('../db/sql_runner')

class Animal

  attr_accessor :name, :type, :date_admitted, :trained, :adoptable, :trained, :adopted
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @date_admitted = options['date_admitted']
    @adoptable = options['adoptable']
    @trained = options['trained']
    @adopted = options['trained']
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_hash = SqlRunner.run(sql)
    animals = animal_hash.map { |animal| Animal.new(animal) }
    return animals
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE animals
    SET (
    name,
    type,
    date_admitted,
    adoptable,
    trained,
    adopted   )
    =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @date_admitted, @adoptable, @trained, @adopted, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      date_admitted,
      adoptable,
      trained,
      adopted
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @date_admitted, @adoptable, @trained, @adopted]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def be_adopted
    @adopted = true
  end

  def be_trained
    @trained = true
  end

  def be_adoptable
    @adoptable = true
  end


  end
