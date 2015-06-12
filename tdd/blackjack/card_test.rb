require 'minitest'  
require 'minitest/autorun'
require './card'

class CardTest < MiniTest::Test

  def setup
    @card = Card.new(2, 'spades')
  end

  def test_a_card_exists
    assert Card
  end

  def test_card_can_be_initialized_with_a_value_and_suit
    assert @card
  end

  def test_card_has_a_value
    assert_equal 2, @card.value
  end

  def test_card_has_a_suit
    assert_equal 'spades', @card.suit
  end

  def test_king_value_is_10
    @king = Card.new('king', 'spades')
    assert_equal 10, @king.value
  end

  def test_ace_value_is_1_or_11
    # this depends on other cards!
  end
end