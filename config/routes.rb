Rails.application.routes.draw do
  root "page#index"

  get '/about' => 'page#about', as: 'about'
end
