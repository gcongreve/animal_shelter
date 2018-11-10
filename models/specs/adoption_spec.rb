require('minitest/autorun')
require('minitest/rg')
require_relative('../adoption')
require_relative('../animal')
require_relative('../customer')

class AdoptionTest < MiniTest::Test

  def setup

   @animal_x = Animal.new({
    'id' => 1,
    'name' => 'James',
    'type' => 'Cat',
    'date_admitted' => "11/11/11",
    'adoptable' => false,
    'trained' => false,
    'adopted' => false
    })

   @customer_a = Customer.new({
   'id' => 1,
   'first_name' => 'Steve',
   'last_name' => 'Humanguy',
   'number_of_adoptions' => 0
   })

   @adoption_a = Adoption.new({
     'id' => 1,
     'animal_id' => @animal_x.id,
     'customer_id' => @customer_a.id
     })
  end

  def test_adoption_can_take_in_ids
    assert_equal(1, @adoption_a.customer_id)
    assert_equal(1, @adoption_a.animal_id )
  end

  def test_adoption_can_return_animal
    assert_equal("James", @adoption_a.animal_name)
  end


end
