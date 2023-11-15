Rails.application.routes.draw do
  # shallow nesting
  resources :reviews, only: %i[destroy]

  resources :restaurants do # 7 CRUD actions for restaurants
    # prefixes all the routes with /restaurants/:id
    resources :reviews, only: %i[new create] # nested resource

    collection do
      # get '/restaurants/top', to: 'restaurants#top'
      get :top
      # get :worst
      # get :your_location
    end

    member do
      # get '/restaurants/:id/chef', to: 'restaurants#chef', as: :restaurant_chef
      get :chef
    end
  end
end
