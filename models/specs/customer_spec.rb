require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup
   @customer1 = Customer.new({
    'id' => 1,
    'first_name' => 'Steve',
    'last_name' => 'Humanguy',
    'number_of_adoptions' => 0
    })
  end

  def test_customer_can_adopt_pet
    @customer1.adopt_pet
    assert_equal(1, @customer1.number_of_adoptions)
  end

  def test_customer_returns_full_name
    assert_equal('Steve Humanguy', @customer1.full_name)
  end





end
