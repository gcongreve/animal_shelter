require('minitest/autorun')
require('minitest/rg')
require_relative('../animal')

class AnimalTest < MiniTest::Test

  def setup
    @animal1 = Animal.new({
    'id' => 100,
    'name' => 'Fred',
    'species' => 'other',
    'type' => 'Octopus',
    'date_admitted' => "11/11/11",
    'healthy' => false,
    'trained' => false
    })

    @animal2 = Animal.new({
    'id' => 100,
    'name' => 'Fred',
    'species' => 'Dog',
    'type' => 'unknown',
    'date_admitted' => "11/11/11",
    'healthy' => false,
    'trained' => false
    })

    @animal3 = Animal.new({
    'id' => 100,
    'name' => 'Fred',
    'species' => 'Dog',
    'type' => 'Labrador',
    'date_admitted' => "11/11/11",
    'healthy' => false,
    'trained' => false
    })
  end


  # def test_can_be_trained
  #   @animal1.be_trained
  #   assert_equal(true, @animal1.trained)
  # end

  def test_display_type__just_type
    assert_equal('Octopus', @animal1.display_type)
  end

  def test_display_type__just_species
    assert_equal('Dog', @animal2.display_type)
  end

  def test_display_type__type_and_species
    assert_equal('Labrador Dog', @animal3.display_type)
  end



end
