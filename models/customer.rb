require_relative ('../db/sql_runner')

class Customer

  attr_accessor :first_name, :last_name, :species_preference, :type_preference
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name'].capitalize
    @last_name = options['last_name'].capitalize
    @species_preference = options['species_preference'].capitalize if options['species_preference']
    @type_preference = options['type_preference'].capitalize if options['type_preference']
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
    species_preference,
    type_preference
       )
    =
    ( $1, $2, $3, $4 )
    WHERE id = $5"
    values = [@first_name, @last_name, @species_preference, @type_preference, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO customers
    ( first_name,
      last_name,
      species_preference,
      type_preference )
    VALUES
    ( $1, $2, $3, $4)
    RETURNING id"
    values = [@first_name, @last_name, @species_preference, @type_preference ]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def adoptions()
    sql = "SELECT adoptions.*
    FROM adoptions
	  WHERE customer_id = $1"
    values = [@id]
    adoptions_hashs = SqlRunner.run(sql, values)
    adoptions = adoptions_hashs.map { |adoption| Adoption.new(adoption) }
    return adoptions
  end

  def number_of_adoptions()
    adoptions.count
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  #return customers previously adopted animals
  def animals()
    sql = "SELECT animals.* FROM animals
    INNER JOIN adoptions
    ON animals.id = animal_id
    WHERE customer_id = $1"
    values = [@id]
    animals_hashs = SqlRunner.run(sql, values)
    animals = animals_hashs.map { |animal| Animal.new(animal)}
    return animals
  end

  def general_preferences()
    sql = "SELECT animals.* FROM animals
    WHERE animals.species = $1 "
    values = [@species_preference]
    animals_hashs = SqlRunner.run(sql, values)
    animals = animals_hashs.map { |animal| Animal.new(animal)}
    return animals
  end

  def display_preference()
    if @species_preference == "Other"
      return @type_preference
    elsif
      @type_preference == "Unknown"
      return @species_preference
    else
      return "#{@type_preference} #{@species_preference}"
    end
  end

  def display_species()
    @species_preference == 'Other' ? "pet" : @species_preference
  end


end
