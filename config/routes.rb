Rails.application.routes.draw do
  resources :appointments
  resources :schedules
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :branches
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show' , as: :profile
  get 'users/' => 'users#index' , as: :users_index

  # Defines the root path route ("/")
   root "landscape#new"
end
