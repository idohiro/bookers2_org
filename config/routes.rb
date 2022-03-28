Rails.application.routes.draw do
  devise_for :users
    root 'homes#top'
   get 'home/about', to: 'homes#show'
       resources :users, path_names: {new: :signup}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books,only: [:new, :create, :index, :show, :destroy,:edit] do
  end
   resources  :users, only: [:show, :edit,:index,:create]
 end
