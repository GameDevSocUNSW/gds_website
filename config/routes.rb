Gds::Application.routes.draw do

   resources :posts 
   match '/home', to: 'posts#index', via: 'get'
   match '/signup', to: 'static_pages#signup', via: 'get'
   match '/sponsors', to: 'static_pages#sponsors', via: 'get'
   match '/showcase', to: 'static_pages#showcase', via: 'get'
   match '/about', to: 'static_pages#about', via: 'get'
   match '/exec', to: 'sessions#create', via: 'post'
   match '/exec', to: 'sessions#new', via: 'get'
   match '/account', to: 'users#edit', via: 'get'
   match '/account', to: 'users#update', via: 'patch'
   match '/signout', to: 'sessions#destroy', via: 'delete'
   match '/newpost', to: 'posts#new', via: 'get'
   match '/newpost', to: 'posts#create', via: 'post'
   match '/tutorials', to: 'static_pages#tutorials', via: 'get'
   #match '/constitution', to: 'static_pages#constitution', via: 'get'
   #match '/contact', to: 'static_pages#contact', via: 'get'
   root 'posts#index'

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
