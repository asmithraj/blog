Rails.application.routes.draw do
  
  root 'articles#index'
  get 'welcome/index'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users', to: 'users#index'
  patch '/users/:id', to: 'users#update', as: 'user_update'
  get '/confluence', to: 'confluences#index'
  get '/confluence/space', to: 'confluences#getspacelist'
  get 'confluence/page/:space_id', to: 'confluences#getspacepages', as: 'page'
  get 'confluence/children/:page_id', to: 'confluences#getchildpages', as: 'child'
  get 'confluence/content/:content_id', to: 'confluences#getviewcontent', as: 'pageview'
  get 'confluence/createjson', to: 'confluences#create_json', as: 'json'
	
	resources :articles do
    resources :comments
  end

  resources :categories do
  end

	get 'categories/:category_id/articles', to: 'articles#showcategoryarticles', as: 'show_all'
  get 'blog/new', to: 'blog#new'
	post 'blog/new', to: 'blog#create'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
