require_relative ('../db/sql_runner')

class Animal

  attr_accessor :name, :type, :species, :date_admitted, :trained, :healthy
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].capitalize
    @species = options['species'].capitalize
    @type = options['type'].capitalize
    @date_admitted = options['date_admitted']
    @healthy = options['healthy'] == 't' ? "true" : "false"
    @trained = options['trained'] == 't' ? "true" : "false"
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_hash = SqlRunner.run(sql)
    animals = animal_hash.map { |animal| Animal.new(animal) }
    return animals
  end


  def self.adoptable
    adoptable = []
    all.each do |animal|
      if animal.adoptable?
        adoptable << animal
      end
    end
    return adoptable
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

  # def self.by_status(status)
  #   if status == 'untrained'
  #     return self.untrained
  #   elsif status == 'unhealthy'
  #     return self.unhealthy
  #   elsif status == "adoptable"
  #     return self.adoptable
  #   elsif status == "in_shelter"
  #     return self.in_shelter
  #   end
  # end

  def self.by_status(status)
    statuses = {
      'untrained' => self.untrained,
      'unhealthy' => self.unhealthy,
      'adoptable' => self.adoptable,
      'in_shelter' => self.in_shelter
    }
    return statuses[status]
  end


  def self.untrained
    sql = "SELECT animals.* FROM animals
    WHERE trained = false;"
    untrained_hash = SqlRunner.run(sql)
    untrained = untrained_hash.map { |animal| Animal.new(animal) }
    return untrained
  end

  def self.unhealthy
    sql = "SELECT animals.* FROM animals
    WHERE healthy = false;"
    unhealthy_hash = SqlRunner.run(sql)
    unhealthy = unhealthy_hash.map { |animal| Animal.new(animal) }
    return unhealthy
  end

  def self.adoptable_number
    number = 0
    all.each { |animal| animal.adoptable? ? number += 1 : 0 }
    return number
  end


  def self.dogs
    sql = "SELECT animals.* FROM animals
    WHERE species = 'Dog' "
    dogs_hash = SqlRunner.run(sql)
    dogs = dogs_hash.map { |dog| Animal.new(dog) }
    return dogs
  end


  def self.by_species(animal_species)
    sql = "SELECT animals.* FROM animals
    WHERE species = $1"
    values = [animal_species]
    species_hash = SqlRunner.run(sql, values)
    animals = species_hash.map { |animal| Animal.new(animal) }
    return animals
  end

  def self.in_shelter
    shelter = []
    all.each do |animal|
      if animal.in_shelter?
        shelter << animal
      end
    end
    return shelter
  end

  def self.cats
    sql = "SELECT animals.* FROM animals
    WHERE species = 'Cat' "
    cats_hash = SqlRunner.run(sql)
    cats = cats_hash.map { |cat| Animal.new(cat) }
    return cats
  end

  def self.cats_shelter
    shelter = []
    cats.each do |cat|
      if cat.in_shelter?
        shelter << cat
      end
    end
    return shelter
  end

  def self.dogs_shelter
    shelter = []
    dogs.each do |dog|
      if dog.in_shelter?
        shelter << dog
      end
    end
    return shelter
  end

  def self.others_shelter
    shelter = []
    others.each do |other|
      if other.in_shelter?
        shelter << other
      end
    end
    return shelter
  end

  def self.others
    sql = "SELECT animals.* FROM animals
    WHERE species = 'Other' "
    others_hash = SqlRunner.run(sql)
    others = others_hash.map { |other| Animal.new(other) }
    return others
  end

  def self.route_to_status(route)
    route_to_status = {
      "in_shelter" => "Animals in the shelter",
      "untrained" => "Untrained Animals",
      "adoptable" => "Adoptable Animals",
      "unhealthy" => "Unwell Animals"
    }
    return route_to_status[route]
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
    species,
    type,
    date_admitted,
    healthy,
    trained )
    =
    ( $1, $2, $3, $4, $5, $6 )
    WHERE id = $7"
    values = [@name, @species, @type, @date_admitted, @healthy, @trained, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      species,
      type,
      date_admitted,
      healthy,
      trained )
    VALUES
    ( $1, $2, $3, $4, $5, $6 )
    RETURNING id"
    values = [@name, @species, @type, @date_admitted, @healthy, @trained]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def adoption()
    sql = "SELECT adoptions.*
    FROM adoptions
	  WHERE animal_id = $1"
    values = [@id]
    adoption_hash = SqlRunner.run(sql, values)
    adoption = adoption_hash.map { |adoption| Adoption.new(adoption) }
    return adoption
  end

  def customer
    sql = "SELECT customers.* FROM customers
    INNER JOIN adoptions
    ON customers.id = customer_id
    WHERE animal_id = $1"
    values = [@id]
    customer_hash = SqlRunner.run(sql, values)
    customer = customer_hash.map { |customer| Customer.new(customer)}
    return customer.first
  end

  def adopted?
    !adoption.empty?
  end

  def in_shelter?
    adoption.empty?
  end

  def adoptable?
    (@trained == 'true') && (@healthy == 'true') && (!adopted?)
  end

  def not_yet_adoptable?
    in_shelter? && !adoptable?
  end

  #for use in tables
  def display_type()
    if @species.downcase == "other"
      return @type
    elsif
      @type.downcase == "unknown"
      return @species
    else
      return "#{@type} #{@species}"
    end
  end

  #for use in sentences in show view
  def display_species()
    @species == "Other" ? "pet" : @species
  end


  #returns all the customers who are interested in animals of the same species
  def customer_species()
    sql = "SELECT customers.* FROM customers
    WHERE customers.species_preference = $1 "
    values = [@species]
    customers_hashs = SqlRunner.run(sql, values)
    customers = customers_hashs.map { |customer| Customer.new(customer)}
    return customers
  end

  #returns all the cusotmers who are interested in animals of the same type
  def customer_type()
    sql = "SELECT customers.* FROM customers
    WHERE customers.species_preference = $1
    AND customers.type_preference = $2"
    values = [@species, @type]
    customers_hashs = SqlRunner.run(sql, values)
    customers = customers_hashs.map { |customer| Customer.new(customer)}
    return customers
  end

end
