Rails.application.routes.draw do
  devise_for :users
  resources :events
  root 'events#index'
  resources :users, only: [:index, :edit, :update]
  resources :my_calendars, only: [:new, :create,:index, :edit, :update]
  resources :shares, only: [:new, :create,:index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
