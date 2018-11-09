require('minitest/autorun')
require('minitest/rg')
require_relative('../animal')

class AnimalTest < MiniTest::Test

  def setup
    @animal1 = Animal.new({
      'id' => 1,
      'name' => 'Fred',
      'type' => 'Dog',
      'date_admitted' => "11/11/11",
      'adoptable' => true,
      'trained' => true,
      'adopted' => false
      })
    end

    def test_can_be_adopted
      @animal1.be_adopted
      assert_equal(true, @animal1.adopted)
    end

  end
