class ApplicationController < ActionController::Base
  helper_method :game

  def game
    session[:game] ||= [ ]
  end

  # def add_player_hand_to_cookie(@blackjack.player_hand.push(@blackjack.deal(2)))
  #   game << @blackjack.player_hand.push(@blackjack.deal(2)).flatten!
  # end

  # def get_player_hand_from_cookie
  #
  # end
end # end of ApplicationController
