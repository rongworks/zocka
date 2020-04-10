Rails.application.routes.draw do
  devise_for :users
  root 'game_entries#index'
  resources :game_entries do
    post :upvote
    post :downvote
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
