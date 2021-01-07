require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < Minitest::Test
  def setup
    dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
    assert_instance_of Museum, dmns
  end
