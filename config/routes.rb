Rails.application.routes.draw do
  	devise_for :admins


  	namespace :admin do
  		resources :entries, param: :slug
  	end

  # You can have the root of your site routed with "root"
  root 'entries#index'

  resources :entries, param: :slug, only: [:show]

 
end
