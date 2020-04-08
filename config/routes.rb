Rails.application.routes.draw do
  resources :articles

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

  # resources :components
  # resources :active_effects
  resources :products

  # root"detach#landing"
  # get 'detach/landing'
  root"detach#index"
  get 'detach/index'

  get 'detach/landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
