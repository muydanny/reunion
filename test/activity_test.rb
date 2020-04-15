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
      @activity.add_participant("Luther", 40)
      expected = {"Maria" => 20, "Luther" => 40}
      assert_equal expected, @activity.participants
      assert_equal 60, @activity.total_cost
    end

    def test_it_can_split
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      @activity.total_cost
      assert_equal 30, @activity.split
    end

    def test_amount_participants_owed
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      @activity.total_cost
      expected = {"Maria" => 10, "Luther" => -10}
      assert_equal expected, @activity.owed
    end
  end
