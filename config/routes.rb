Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :ingredients
      resources :tags
      resources :categories
      resources :materials
      resources :measurement_units
    end
  end
end
