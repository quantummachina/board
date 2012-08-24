Board::Application.routes.draw do

  resources :comments

  resources :externallinks
  resources :sections
  resources :tls
  
  resources :extras

  resources :attachments

  root to: 'static_pages#landing'

  match '/signup',  to: 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signin',  to: 'sessions#new'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/terms', to: 'static_pages#terms_of_service'
  match '/privacy', to: 'static_pages#privacy_policy'
  match '/invite', to: 'static_pages#invite'
  match '/suscribe', to: 'collaborations#suscribe'
  match '/nav', to: 'collections#index'
  match '/secure', to: 'static_pages#secure'
  match '/i_can_help', to: 'requests#icanhelp'#
  match '/invite_to_collaborate', to: 'requests#invite'#'conversations#icanhelp'
  match '/add_vacants', to: 'collections#add_vacants'
  

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :collections do
    member do
      get :devacant
      get :promote
      get :successful
      get :weekly
      get :switchstat
      get :markfinished
    end
  end
  resources :collaborations
  resources :lines, only:[:create, :index]
  resources :conversations, only:[:create, :index, :show]
  resources :items do
    member do
      get :crosspost
      get :setcover
    end
  end

  resources :vacants
  resources :sprojects
  resources :notifications
  resources :requests do
    member do
      get :accept
    end
  end
  resources :genvars


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
