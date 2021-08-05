Rails.application.routes.draw do
  root 'gossip#index'
  resources :gossip
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities do
    resources :gossip
  end
  resources :gossip do
    resources :comments
  end
  


  
  # get '/landing/:page', to: 'welcome#landing'
  # get '/team', to: 'team#to_page'
  # get '/contact', to: 'contact#def1'
  # get 'gossips/:num_gossip', to: 'show_one_potin#show', as: "prefix_new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
