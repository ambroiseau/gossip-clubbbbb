Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
    get '/login',   to: 'registrations#new'
    post '/login',   to: 'registrations#create'
    delete '/logout',  to: 'registrations#destroy'
  
  resources :users do
    resources :gossips
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
