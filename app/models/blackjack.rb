class Blackjack < ApplicationRecord
  attr_accessor :deck, :dealer_hand, :player_hand

  before_create do
    self.deck = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    self.dealer_hand = []
    self.player_hand = []
    # self.shuffle
    # self.player_hand.push(self.deal(2)).flatten!
    # self.dealer_hand.push(self.deal(2)).flatten!
  end

  # def initialize
  #   @deck = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  #   @dealer_hand = []
  #   @player_hand = []
  # end

  def shuffle
    deck.shuffle!
  end

  def deal(cards)
    deck.shift(cards)
  end

  def hand_total(hand)
    hand_values(hand).reduce(:+)
  end

  def hand_values(hand)
    aces = 0
    hand_size = hand.size
    no_aces_hand = []

    hand.each do |element|
      if element == 'A'
        aces += 1

      elsif %w[J Q K].include?(element)
        no_aces_hand.push(10)
      else
        no_aces_hand.push(element)
      end
      no_aces_hand
    end

    no_aces_hand = [0] if aces == hand_size

    if aces == 0
      no_aces_hand
    elsif aces > 0
      if (no_aces_hand.reduce(:+) + 11) > 21
        no_aces_hand.push(1 * aces)
        no_aces_hand
      else
        no_aces_hand.push(11 + (aces - 1))
        no_aces_hand
      end
    end
  end

  def deal_deck_2(deck, card1, card2)
    deck.delete(card1, card2)
    deck
  end

  def prompt
    puts "hand: #{player_hand}"
    puts "hand total: #{hand_total(player_hand)}"
    puts '1 = hit'
    puts '2 = stay'

    input = gets.chomp
  end

  def execute_prompt(input)
    if input == '2'
      'exit'
    else
      player_hand.push(deal(1)).flatten!
      print player_hand
    end
  end
end # end blackjack class

def runner
  puts 'start'
  input = nil
  game = Blackjack.new

  game.shuffle
  # binding.pry
  game.player_hand.push(game.deal(2)).flatten!
  game.dealer_hand.push(game.deal(2)).flatten!

  while game.hand_total(game.player_hand) < 21 && input != 'exit'
    input = game.execute_prompt(game.prompt)
  end
  puts "Player Hand total : #{game.hand_total(game.player_hand)}"

  if game.hand_total(game.player_hand) > 21
    puts 'Dealer Wins'
  else # ###less than player hand??
    while game.hand_total(game.dealer_hand) < 17
      game.dealer_hand.push(game.deal(1)).flatten!
      puts 'dealer hand'
      puts ''
      print game.dealer_hand
      puts ''
      print game.hand_total(game.dealer_hand)
      puts ''
    end

    puts 'Player Hand'

    print game.player_hand
    puts ''
    puts 'Dealer Hand'

    print game.dealer_hand
    puts ''

    if game.hand_total(game.dealer_hand) > 21
      puts 'player wins'
    elsif game.hand_total(game.player_hand) > game.hand_total(game.dealer_hand)
      puts 'player wins'
    elsif  game.hand_total(game.player_hand) < game.hand_total(game.dealer_hand)
      puts 'dealer wins'
    else
      puts 'tie'
    end
  end
end # end of Blackjack
