Rails.application.routes.draw do
    resources :hostings
    devise_for :users
    root to: 'pages#home'
end
