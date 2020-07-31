Rails.application.routes.draw do
  devise_for :users
  resources :events
  root 'events#index'
  resources :users, only: [:edit, :update]
  resources :my_calendars, only: [:index, :new, :create, :add, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
