Rails.application.routes.draw do
  devise_for :admins
  resources :entries

  # You can have the root of your site routed with "root"
  root 'entries#index'

 
end
