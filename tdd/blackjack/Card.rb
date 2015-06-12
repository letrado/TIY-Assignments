class Card
  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    # what should this do?
    # for the 2 of spades, this should be 2
    # for the king of spades, this should be 10
    if @value.is_a?(String)
      10
    else
      @value
    end
  end

end