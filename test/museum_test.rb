require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_returns_a_correct_name
    assert_equal @dmns.name, "Denver Museum of Nature and Science"
  end

  def test_if_its_exhibits_are_empty
    assert_equal @dmns.exhibits, []
  end

  def test_it_has_an_exhibit
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    assert_equal @dmns.exhibits, []
    @dmns.add_exhibit (gems_and_minerals)
    assert_equal @dmns.exhibits, [gems_and_minerals]
  end

  def test_it_recommends_exhibits
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)
    assert_equal @dmns.recommend_exhibits(patron_1),  [dead_sea_scrolls, gems_and_minerals]
  end
end
