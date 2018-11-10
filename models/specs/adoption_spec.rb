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
    'healthy' => false,
    'trained' => false
    })

   @customer_x = Customer.new({
   'id' => 1,
   'first_name' => 'Steve',
   'last_name' => 'Humanguy',
   })

   @adoption_x = Adoption.new({
     'id' => 1,
     'animal_id' => @animal_x.id,
     'customer_id' => @customer_x.id
     })
  end

  def test_adoption_can_take_in_ids
    assert_equal(1, @adoption_x.customer_id)
    assert_equal(1, @adoption_x.animal_id )
  end

  #returns from database- can't test, returns expected answers though
  # def test_adoption_can_return_animal
  #   assert_equal("James", @adoption_x.animal)
  # end


end
