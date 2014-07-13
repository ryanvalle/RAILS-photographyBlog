Rails.application.routes.draw do
  root "page#index"

  get '/about' => 'page#about', as: 'about'

  resources :admin, :path => "admin", only: [:index, :new, :create]
  	post '/session' => 'admin#auth', as: "session"
  	get '/signout' => 'admin#signout', as: "admin_signout"
		get '/admin/images' => "admin#images", as: "images_admin"
		get '/admin/articles' => "admin#articles", as: "articles_admin"
		get '/admin/edit/:id' => "admin#edit", as: "edit_admin"
		patch '/admin/update' => 'admin#update', as: 'update_admin'

	resources :gallery, :path => "gallery"
		get '/admin/add-image' => "gallery#new", as: "add_gallery"
		post '/admin/create-image' => "gallery#create", as: "create_gallery"

	resources :article, :path => "article"
		get '/article/:id' => "article#show", as: "show_article"

end
