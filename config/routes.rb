Rails.application.routes.draw do
  root 'chat_rooms#index'

  resources :chat_rooms, only: [:new, :create, :index] do
    resources :messages, only: [:create, :index]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
