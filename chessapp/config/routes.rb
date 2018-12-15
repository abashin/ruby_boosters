Rails.application.routes.draw do
  get '/game', to: 'user#game'
  get '/champions', to: 'user#champions'
  get "/player/:id", to: "user#show", as: 'player'
  root 'user#main_menu'
end
