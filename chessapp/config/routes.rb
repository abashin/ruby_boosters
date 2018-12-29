Rails.application.routes.draw do
  get '/game', to: 'user#game'
  get '/champions', to: 'user#champions'
  get "/player/:id", to: "user#show", as: 'player'
  get '/create_player', to: "user#create_player"
  get '/new_player', to: "user#new_player"
  post '/create_player', to: "user#create_player"
  root 'user#main_menu'
end
