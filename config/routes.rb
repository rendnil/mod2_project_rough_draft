Rails.application.routes.draw do
  resources :blackjacks, only: [:index]
  get "/blackjacks/game", to: "blackjacks#start_game", as: "game"
  post "/blackjacks/game", to: "blackjacks#hit", as: "hit"
  get "/blackjacks/cookies", to: "blackjacks#cookies"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
