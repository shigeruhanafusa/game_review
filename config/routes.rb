Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :create, :new, :show] do
    resources :ratings, only: [:create, :new ,:index]
  end
end
