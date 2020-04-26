Rails.application.routes.draw do
  # Routes Root 
  root 'welcome#index' 

  # Routes User
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users, only: [:show, :edit, :update]
end
