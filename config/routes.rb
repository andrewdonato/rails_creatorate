
Rails.application.routes.draw do
  resources :users do
    resources :projects
  end

  post '/users/:user_id/projects/:id/collaborate', to: "projects#collaborate"

  get '/logout', to: "users#logout"

  post '/login', to: "users#login"

  root 'public#home'
end
