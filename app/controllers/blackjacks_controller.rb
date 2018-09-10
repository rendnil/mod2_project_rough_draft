class BlackjacksController < ApplicationController

  def index
  end

  def start_game
      # @blackjack = Blackjack.create
      # @blackjack.shuffle
      # @blackjack.player_hand.push(@blackjack.deal(2)).flatten!
      # @blackjack.dealer_hand.push(@blackjack.deal(2)).flatten!
      # @blackjack.update(deck: @blackjack.deck, player_hand: @blackjack.player_hand, dealer_hand: @blackjack.dealer_hand)
      #
        @new_game =  Blackjack.create
        @new_game.shuffle
        @new_game.player_hand.push(@new_game.deal(2)).flatten!
        @new_game.dealer_hand.push(@new_game.deal(2)).flatten!
        @new_game.update(deck: @new_game.deck, player_hand: @new_game.player_hand, dealer_hand: @new_game.dealer_hand)

        game << @new_game.id
    render :game
  end

  def cookies
    # byebug
    @blackjack = Blackjack.find(game.first)
  end
  # def hit
  #   @blackjack.player_hand.push(@blackjack.deal(1)).flatten!
  #   render :game
  # end

  # def game
  #
  # end
  private
  def set_params
    params.require(:blackjack).permit(:player_hand)
  end

end # end of BlackjacksController
