Rails.application.routes.draw do
  root "page#index"

  get '/about' => 'page#about', as: 'about'

  resources :admin, :path => "admin"
  	post '/session' => 'admin#auth', as: "session"
  	get '/signout' => 'admin#signout', as: "admin_signout"
end
