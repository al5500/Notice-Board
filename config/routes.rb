# == Route Map
#
#        Prefix Verb   URI Pattern                    Controller#Action
#    categories GET    /categories(.:format)          categories#index
#               POST   /categories(.:format)          categories#create
#  new_category GET    /categories/new(.:format)      categories#new
# edit_category GET    /categories/:id/edit(.:format) categories#edit
#      category GET    /categories/:id(.:format)      categories#show
#               PATCH  /categories/:id(.:format)      categories#update
#               PUT    /categories/:id(.:format)      categories#update
#               DELETE /categories/:id(.:format)      categories#destroy
#       notices GET    /notices(.:format)             notices#index
#               POST   /notices(.:format)             notices#create
#    new_notice GET    /notices/new(.:format)         notices#new
#   edit_notice GET    /notices/:id/edit(.:format)    notices#edit
#        notice GET    /notices/:id(.:format)         notices#show
#               PATCH  /notices/:id(.:format)         notices#update
#               PUT    /notices/:id(.:format)         notices#update
#               DELETE /notices/:id(.:format)         notices#destroy
#          root GET    /                              pages#home
#    edit_users GET    /users/edit(.:format)          users#edit
#         users GET    /users(.:format)               users#index
#               POST   /users(.:format)               users#create
#      new_user GET    /users/new(.:format)           users#new
#          user GET    /users/:id(.:format)           users#show
#               PATCH  /users/:id(.:format)           users#update
#               PUT    /users/:id(.:format)           users#update
#               DELETE /users/:id(.:format)           users#destroy
#         login GET    /login(.:format)               session#new
#               POST   /login(.:format)               session#create
#               DELETE /login(.:format)               session#destroy
#

Rails.application.routes.draw do
  resources :categories
  resources :notices
   root :to => 'pages#home'
   
   resources :users, :except => [:edit] do
    collection do
      get '/edit' => 'users#edit'
    end
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
