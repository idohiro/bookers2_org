Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :book,only: [:new, :create, :index, :show, :destroy] do
    resources :home,only: [:index,:about]
    resources :users, only: [:show, :edit, :update]
  end
end