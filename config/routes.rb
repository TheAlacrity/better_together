Rails.application.routes.draw do
  namespace :api do
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get '/images' => 'images#index'
    post '/images' => 'images#create'
    get '/images/:id' => 'images#show'
    patch '/images/:id' => 'images#update'
    delete '/images/:id' => 'images#destroy'

    post '/sessions' => 'sessions#create'

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

    get '/user_hangouts' => 'user_hangouts#index'
    post '/user_hangouts' => 'user_hangouts#create'
    get '/user_hangouts/:id' => 'user_hangouts#show'
    patch '/user_hangouts/:id' => 'user_hangouts#update'
    delete '/user_hangouts/:id' => 'user_hangouts#destroy'

    get '/requests' => 'requests#index'
    post '/requests' => 'requests#create'
    get '/requests/:id' => 'requests#show'
    delete '/requests/:id' => 'requests#destroy'

    get '/matches' => 'matches#index'

    get '/messages' => 'messages#index'
    post '/messages' => 'messages#create'
    get '/messages/:id' => 'messages#show'
    delete '/messages/:id' => 'messages#destroy'

    get '/reset_demo' => 'requests#reset_demo'
  end
end
