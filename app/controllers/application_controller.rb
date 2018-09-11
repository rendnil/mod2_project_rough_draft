class ApplicationController < ActionController::Base
  helper_method :game
  helper_method :deck
  helper_method :player_hand
  helper_method :dealer_hand

  def game
    session[:game] ||= [ ]

  end

  def deck
    session[:deck] ||= [ ]
  end

  def player_hand
    session[:player_hand] ||= [ ]
  end

  def dealer_hand
    session[:dealer_hand] ||= [ ]
  end


  # def add_player_hand_to_cookie(@blackjack.player_hand.push(@blackjack.deal(2)))
  #   game << @blackjack.player_hand.push(@blackjack.deal(2)).flatten!
  # end

  # def get_player_hand_from_cookie
  #
  # end
end # end of ApplicationController
