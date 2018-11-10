require_relative ('../db/sql_runner')

class Adoption

  attr_reader :id, :customer_id, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @customer_id = options['customer_id'].to_i
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


end
