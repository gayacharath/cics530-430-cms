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

  match 'users/:id/create_admin' => "admins#create", :as => :create_admin, :via => :get
  match 'users/:id/destroy_admin' => "admins#destroy", :as => :remove_admin, :via => :get
  

  root :to => 'sessions#new'

end
