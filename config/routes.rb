Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :transactions, only: [:index, :show, :create]

  get "/monzo/fetch", to: "authentications#fetch", as: :monzo_fetch
  get "/monzo/callback", to: "authentications#callback", as: :monzo_callback
  get "/monzo/refresh", to: "authentications#refresh", as: :monzo_refresh

  resources :authentications, only: [:index]
end
