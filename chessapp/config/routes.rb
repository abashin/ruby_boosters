Rails.application.routes.draw do
  get '/game', to: 'user#game'
  get '/champions', to: 'user#champions'
  root 'user#main_menu'
end
