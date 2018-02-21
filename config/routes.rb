Rails.application.routes.draw do


  resources :home
root   'home#index'
 get '/contact', to: 'contact#new', as: 'new_contact'
 post '/contact', to: 'contact#create', as: 'create_contact'
 # get 'sermons/index'
 # get 'gallery/index'
 get 'about' => 'about#us'
  get 'staff' => 'staff#staff'
  get 'index' => 'home'
  get 'ministries' => 'staff'
  get 'gallery' => 'gallery'
  get 'sermons' => 'sermons'
  get 'calendar' => 'calendar'




 
   get 'donate' => 'donate#new'
   get '/redirect', to: 'events#redirect', as: 'redirect'
  get '/callback', to: 'events#callback', as: 'callback'
  get '/calendars', to: 'events#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'events#calendar_items', as: 'calendar_items', calendar_id: /[^\/]+/

  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  resources :events, :only => [:index]
  




  # resource :gives

 
  
  

 
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
