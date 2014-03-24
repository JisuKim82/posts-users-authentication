PostsUsersAuthentication::Application.routes.draw do
  get '/users/new' => "users#new"
  post '/users' => "users#create"
  
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"


  get '/posts/new' => "posts#new"
  get '/posts' => "posts#index"
  post '/posts' => "posts#create"


  get '/posts/:id' => "posts#show", as: "post"
  patch '/posts/:id' => "posts#update"
  delete '/posts/:id' => "posts#destroy"
  get '/posts/:id/edit' => "posts#edit", as: 'edit_post'

end
