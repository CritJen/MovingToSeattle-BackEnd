Rails.application.routes.draw do
  resources :locations
  resource :load_data

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
