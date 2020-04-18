Rails.application.routes.draw do
  resources :groups do
    member do
      post :add_game
      post :add_user
    end
  end
  resources :recommendations
  devise_for :users
  root 'game_entries#index'
  resources :game_entries do
    member do
      post :upvote
      post :downvote
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
