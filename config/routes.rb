Rails.application.routes.draw do
  resources :users
  resource :session
  resources :goals
end
