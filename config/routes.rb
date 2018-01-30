Rails.application.routes.draw do
  resources :users, controller: :user
  resources :memos, controller: :memo
  # get '/users' => 'user#index'
  # get '/memos' => 'memo#index'
end
