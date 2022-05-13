Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :earnings do
    collection {post :import}
  end
  resource :session, only:[:new, :create, :destroy]
  # Defines the root path route ("/")
  root "earnings#index"
end
