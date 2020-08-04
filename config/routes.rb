Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users, only: [:index, :edit, :update]
  resources :my_calendars, only: [:new, :create,:index, :edit, :update] do
    resources :events, only: [:index, :edit, :update,:new, :create,:destroy]
  end
  resources :events, only: [:index, :edit, :update,:new, :create,:destroy]
  resources :shares, only: [:new, :create,:index, :edit, :update] do
    resources :events, only: [:index, :edit, :update,:new, :create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
