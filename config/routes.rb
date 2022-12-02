Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :branches
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "landscape#new"
end
