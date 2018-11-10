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
      'healthy' => false,
      'trained' => false
      })
    end


    def test_can_be_trained
      @animal1.be_trained
      assert_equal(true, @animal1.trained)
    end



  end
