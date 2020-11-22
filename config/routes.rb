Rails.application.routes.draw do
  
root "patients#index"

  resources :doctors 
  resources :patients do
    resources :appointments 
  end
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
