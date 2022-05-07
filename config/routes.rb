Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :earnings do
    collection {post :import}
  end
  # Defines the root path route ("/")
  root "earnings#index"
end
