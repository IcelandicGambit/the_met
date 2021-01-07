require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test
  def setup
    patron_1 = Patron.new ("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, patron
  end

  def test_it_can_add_interests
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.add_interest 
  end
end
