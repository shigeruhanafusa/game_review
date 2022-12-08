Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: %i[index create new show] do
    resources :ratings, only: %i[create new index]
  end
end
