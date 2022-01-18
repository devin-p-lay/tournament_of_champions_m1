Rails.application.routes.draw do
  resources :competitions, only: [:show, :index] do
    resources :teams, only: [:new, :create]
  end
  resources :teams, only: :index
end
