require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
    end

    def test_it_exists
      assert_instance_of Activity, @activity
    end

    def test_it_has_attributes
      assert_equal "Brunch", @activity.name
      assert_equal ({}), @activity.participants
    end

    def test_it_can_add_participants
      @activity.add_participant("Maria", 20)
      expected = {"Maria" => 20}
      assert_equal expected, @activity.participants
    end

    def test_it_has_a_total_cost
      @activity.add_participant("Maria", 20)
      assert_equal 20, @activity.total_cost
    end
  end
