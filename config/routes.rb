Rails.application.routes.draw do
  resources :appointments
  resources :schedules
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :branches
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show' , as: :profile
  get 'users/' => 'users#index' , as: :users_index
  get 'users/:id/edit' => 'users#edit' , as: :users_edit
  patch 'users/:id/edit' => 'users#update' , as: :users_update_patch
  get 'create/user/' => 'users#new' , as: :users_new
  post 'create/user/' => 'users#create' , as: :users_create
  delete 'users/:id/edit' => 'users#destroy' , as: :users_destroy

  
  # Defines the root path route ("/")
   root "landscape#new"
end
