Twitstagram::Application.routes.draw do
  root  'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/tnc', to: 'static_pages#tnc', via: 'get'
  match '/admin', to: 'static_pages#admin', via: 'get'
  
  #admin_group
  namespace :admin do
    match '/groups', to: 'groups#create', via: 'post'
    match '/groups', to: 'groups#index', via: 'get'
    match '/groups/:id', to: 'groups#show', via: 'get'
    match '/groups/:id', to: 'groups#update', via: 'patch'
    match '/groups/:id/edit', to: 'groups#edit', via: 'get'
    match '/groups/:id/delete', to: 'groups#destroy', via: 'get'

    match '/groups/:id/subjects', to: 'subjects#create', via: 'post'
    match '/groups/:id/subjects/:s_id/delete', to: 'subjects#destroy', via: 'get'
    match '/groups/:id/subjects/:s_id', to: 'subjects#update', via: 'patch'
    match '/groups/:id/subjects/:s_id/edit', to: 'subjects#edit', via: 'get'
  end

  #search
  match '/search', to: 'search#view', via: 'get'
  match '/search', to: 'search#redirect', via: 'post'
  match '/search/:query', to: 'search#view', via: 'get'
  

  #group
  match '/groups/:id/:name', to: 'group#view', via: 'get'
  match '/groups/:id/:name/tweets', to: 'group#tweets', via: 'get'
  match '/groups/:id/:name/photos', to: 'group#photos', via: 'get'

  match '/', to: 'static_pages#home', via: 'get'

  namespace :api do
    match '/groups', to: 'groups#index', via: 'get'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
