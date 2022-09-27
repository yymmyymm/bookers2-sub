Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about" , as: "about"

  resources :books, only: [:new, :create, :update, :edit, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
