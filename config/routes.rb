Rails.application.routes.draw do
  resources :articles do
    member do
      get :bookmark
    end
  end

  devise_for :users do
    resources :profiles
  end

  resources :profiles do
    resources :favorites
    resources :follows
  end

  resources :brands do
    resources :products
  end
  resources :products

  # resources :components
  # resources :active_effects
  resources :comments
  get '/catalog', to: 'products#index', as: :catalogs
  get 'catalog/:id', to: 'products#catalog', as: :catalog
  # resources :products do
  # end

  # root"detach#landing"
  # get 'detach/landing'
  root"detach#index"
  get 'detach/index'

  get 'detach/landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
