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

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type
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

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Zombie.new( hash ) }
  end

  def self.find( id )
  sql = "SELECT * FROM animals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Animal.new( results.first )
end


end
