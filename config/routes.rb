Rails.application.routes.draw do
  # resources :users
  get '/index' => 'user#index'
end
