Rails.application.routes.draw do
  resources :users

  root 'public#home'
end
