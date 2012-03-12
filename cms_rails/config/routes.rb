CmsRails::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :staffs

  resources :announcements

  resources :projects

  resources :resources
  
  resources :sessions
  
  resources :users
  
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  

  root :to => 'sessions#new'

end
