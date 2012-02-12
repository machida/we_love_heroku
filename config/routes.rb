Gallery::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:sessions]
  devise_scope :user do
    match '/users/sign_out(.:format)', {:action=>"destroy", :controller=>"devise/sessions", :via => :delete, :as => :destroy_user_session }
    match '/(.:format)', {:action=>"index", :controller=>"sites", :via => :get, :as => :new_user_session }
  end

  resources :sites
  get '/users/current' => 'users#current', :as => :current_user
  get '/users/login' => 'users#login', :as => :login_user
  get '/users/:provider/:user_key' => 'users#show', :as => :user
  delete '/users/' => 'users#destroy'
  
  get '/page/:page' => 'sites#index'
  root :to => 'sites#index'
end
