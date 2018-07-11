Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats do
    get '/rental_requests', to: 'cat_rental_requests#index'
    # resources :rental_requests, only: [:index]
  end
  
  get '/rental_requests/new', to: 'cat_rental_requests#new'
  post '/rental_requests', to: 'cat_rental_requests#create'
  # resources :rental_requests, only: [:new, :create]
end
