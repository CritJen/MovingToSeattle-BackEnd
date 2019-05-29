Rails.application.routes.draw do
  resources :properties
  resources :categories
  resources :locations
  resources :load_data

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
