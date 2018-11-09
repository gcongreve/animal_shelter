require_relative ('../db/sqlrunner')

class Animal

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
    return animal_hash.map { |animal| Animal.new(animal) }
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
    values = @id
    SqlRunner.run(sql, values)

    def update()
    sql = "UPDATE animals
      SET (
      name,
      type,
      date_admitted,
      adoptable,
      trained,
      adopted   )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @type, @adoptable, @trained, @adopted, @id]
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
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @adoptable, @trained, @adopted]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


end
