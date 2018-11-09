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
      'adoptable' => false,
      'trained' => false,
      'adopted' => false
      })
    end

    def test_can_be_adopted
      @animal1.be_adopted
      assert_equal(true, @animal1.adopted)
    end

    def test_can_be_trained
      @animal1.be_trained
      assert_equal(true, @animal1.trained)
    end

    def test_can_be_adoptable
      @animal1.be_adoptable
      assert_equal(true, @animal1.adoptable)
    end



  end
