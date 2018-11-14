require_relative ('../db/sql_runner')
require_relative('./animal')
require_relative('./customer')

class Adoption

  attr_accessor :id, :customer_id, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @customer_id = options['customer_id']
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    adoptions_hashs = SqlRunner.run(sql)
    adoptions = adoptions_hashs.map { |adoption| Adoption.new(adoption) }
    return adoptions
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM adoptions
            WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Adoption.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO adoptions
    ( animal_id,
      customer_id )
    VALUES
    ( $1, $2 )
    RETURNING id"
    values = [@animal_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE adoptions
    SET (
    animal_id,
    customer_id )
    =
    ( $1, $2 )
    WHERE id = $3"
    values = [@animal_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  #return animal object from adoption
  def animal()
    sql = "SELECT animals.* FROM animals
    INNER JOIN adoptions
    ON animals.id = animal_id
    WHERE adoptions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    animal = Animal.new(result.first)
    return animal
  end

  def animal_name()
    animal.name
  end

  #return customer object from adoption
  def customer()
    sql = "SELECT customers.* FROM customers
    INNER JOIN adoptions
    ON customers.id = customer_id
    WHERE adoptions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    customer = Customer.new(result.first)
    return customer
  end

end
