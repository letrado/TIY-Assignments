require 'minitest'
require 'minitest/autorun'
require './deck'

class DeckTest < MiniTest::Test

  def test_deck_exists
    assert Deck
  end

  def test_deck_is_initialized_with_cards_in_it
    @deck = Deck.new(52)
    assert @deck
  end

  def test_deck_has_52_cards
    @deck = Deck.new(52)
    assert_equal 52, @deck.cards
  end
end