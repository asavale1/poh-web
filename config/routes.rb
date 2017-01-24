Rails.application.routes.draw do
  root 'static_pages#home'
  match '/api/post_answer', to: 'api#post_answer', via: 'post'
  match '/api/get_question', to: 'api#get_question', via: 'get'
  match '/api/get_results', to: 'api#get_results', via: 'get'
  
  match '/admin', to: 'admins#home', via: 'get'
  match '/admin/new', to: 'admins#new', via: 'get'
  match '/admin/create', to: 'admins#create_admin', via: 'post'
  match '/admin/login', to: 'admins#login', via: 'get'
  match '/admin/login_attempt', to: 'admins#login_attempt', via: 'post'
  match '/admin/logout', to: 'admins#logout', via: 'get'
 
  match '/admin/question/new', to: 'question#new', via: 'get'
  match '/admin/question/create', to: 'question#create', via: 'post'
  match '/admin/question/destroy', to: 'question#destroy', via: 'post'
  match '/admin/question/edit', to: 'question#edit', via: 'get'
  match '/admin/question/update', to: 'question#update', via: 'post'
  match '/admin/question', to: 'question#index', via: 'get'
  match '/admin/question/view', to: 'question#view', via: 'get'
  match '/admin/question/notify', to: 'question#send_notification', via: 'get'


  namespace :api, constraints: {format: :json} do
    namespace :v1 do
      scope :question do
        match '/', to: 'question#get_question', via: 'get'
        match '/', to: 'question#post_answer', via: 'post'
        match '/:id', to: 'question#get_results', via: 'get'
        match '/request', to: 'question#request_question', via: 'post'
      end

      scope :android do
        match '/register', to: 'firebase#register', via: 'post'
      end
    end
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
