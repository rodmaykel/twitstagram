Twitstagram::Application.routes.draw do
  root  'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/tnc', to: 'static_pages#tnc', via: 'get'
  match '/admin', to: 'static_pages#admin', via: 'get'
  
  #admin_group
  match '/admin/groups', to: 'admin_groups#create', via: 'post'
  match '/admin/groups', to: 'admin_groups#index', via: 'get'
  match '/admin/groups/:id', to: 'admin_groups#show', via: 'get'
  match '/admin/groups/:id', to: 'admin_groups#update', via: 'patch'
  match '/admin/groups/:id/edit', to: 'admin_groups#edit', via: 'get'
  match '/admin/groups/:id/delete', to: 'admin_groups#destroy', via: 'get'

  match '/admin/groups/:id/subjects', to: 'admin_subjects#create', via: 'post'
  match '/admin/groups/:id/subjects/:s_id/delete', to: 'admin_subjects#destroy', via: 'get'

  #search
  match '/search', to: 'search#view', via: 'get'
  match '/search', to: 'search#redirect', via: 'post'
  match '/search/:query', to: 'search#view', via: 'get'
  

  #group
  match '/groups/:id/:name', to: 'group#view', via: 'get'
  match '/groups/:id/:name/tweets', to: 'group#tweets', via: 'get'
  match '/groups/:id/:name/photos', to: 'group#photos', via: 'get'

  match '/', to: 'static_pages#home', via: 'get'

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
