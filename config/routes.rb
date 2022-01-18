Rails.application.routes.draw do
  resources :competitions, only: :index
end
