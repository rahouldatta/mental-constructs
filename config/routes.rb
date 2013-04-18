MentalConstructs::Application.routes.draw do


  resources :concepts


  resources :thinker do
    member do
      get 'delete_epiphany'
      get 'delete_brainwave'
      get 'delete_factoid'
      get 'delete_remembrall'
      get 'delete_link'
      get 'delete_concept'
      get 'mark_remembrall_as_complete'
      get 'delete_dossier'
    end
    collection do
      post 'google_search'
      post 'wikipedia_search'
      post 'bing_search'
      post 'yahoo_search'
      post 'record_factoids'
      post 'record_epiphanies'
      post 'record_brainwaves'
      post 'record_remembrall'
      post 'record_link'
      post 'decide_concepts_display_order'
      post 'add_concept_dossier'
      post 'set_concept_dossier_quality'
    end
  end

  devise_for :thinkers, :controllers => { :registrations => :registrations }

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
  get "home/index"

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
