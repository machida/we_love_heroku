Gallery::Application.routes.draw do
  resources :sites, :except => [:destroy]

  root :to => 'sites#index'
end
