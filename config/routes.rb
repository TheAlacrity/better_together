Rails.application.routes.draw do
  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/hangouts' => 'hangouts#index'
  post '/hangouts' => 'hangouts#create'
  get '/hangouts/:id' => 'hangouts#show'
  patch '/hangouts/:id' => 'hangouts#update'
  delete '/hangouts/:id' => 'hangouts#destroy'

  get '/categories' => 'categories#index'
  post '/categories' => 'categories#create'
  get '/categories/:id' => 'categories#show'
  patch '/categories/:id' => 'categories#update'
  delete '/categories/:id' => 'categories#destroy'

  get 'user_hangouts' => 'user_hangouts#index'
  post 'user_hangouts' => 'user_hangouts#create'
  get '/user_hangouts/:id' => 'user_hangouts#show'
  patch '/user_hangouts/:id' => 'user_hangouts#update'
  delete '/user_hangouts/:id' => 'user_hangouts#destroy'


end
