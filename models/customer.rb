require_relative ('../db/sql_runner')

class Customer

  attr_accessor :first_name, :last_name, :number_of_adoptions
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @number_of_adoptions = options['number_of_adoptions']
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashs = SqlRunner.run(sql)
    customers = customer_hashs.map { |customer| Customer.new(customer) }
    return customers
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers
    SET (
    first_name,
    last_name,
    number_of_adoptions
       )
    =
    ( $1, $2, $3 )
    WHERE id = $4"
    values = [@first_name, @last_name, @number_of_adoptions, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO customers
    ( first_name,
      last_name,
      number_of_adoptions )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [@first_name, @last_name, @number_of_adoptions]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def adopt_pet
    @number_of_adoptions += 1
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end


end
