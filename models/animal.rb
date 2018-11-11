require_relative ('../db/sql_runner')

class Animal

  attr_accessor :name, :type, :species, :date_admitted, :trained, :healthy, :trained
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @type = options['type']
    @date_admitted = options['date_admitted']
    @healthy = options['healthy']
    @trained = options['trained']
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
    species,
    type,
    date_admitted,
    healthy,
    trained )
    =
    ( $1, $2, $3, $4, $5, $6 )
    WHERE id = $6"
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
    adoptions_hashs = SqlRunner.run(sql, values)
    adoptions = adoptions_hashs.map { |adoption| Adoption.new(adoption) }
    return adoptions
  end

  def adopted?
    !adoption.empty?
  end

  def adoptable?
    if (@trained == 't') && (@healthy == 't') && (!adopted?)
      return true
    else
      return false
    end
  end


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


end
