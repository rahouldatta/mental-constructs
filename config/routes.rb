MentalConstructs::Application.routes.draw do


  resources :exhibits do
    collection do
      post 'search_exhibits'
    end
  end

  get "howl/index"
  get 'howl/update_howl_display'
  post 'howl/record_howl'

  resources :constructs do
    member do
      get 'share_construct'
    end
  end


  resources :thinker do
    member do
      get 'delete_epiphany'
      get 'delete_brainwave'
      get 'delete_factoid'
      get 'delete_remembrall'
      get 'delete_link'
      get 'delete_construct'
      get 'mark_remembrall_as_complete'
      get 'delete_dossier'
      get 'remove_construct_from_dossier'
      get 'delete_flash'
      get 'delete_subpoint'
      get 'delete_brain_storm'
      get 'provocation'
      get 'get_next_exhibit'
    end
    collection do
      post 'search_thinker_data'
      post 'new_brain_storm_session'
      post 'start_previous_brain_storm_session'
      post 'google_search'
      post 'wikipedia_search'
      post 'bing_search'
      post 'yahoo_search'
      post 'record_factoids'
      post 'record_epiphanies'
      post 'record_brainwaves'
      post 'record_remembrall'
      post 'record_link'
      post 'decide_constructs_display_order'
      post 'add_construct_dossier'
      post 'add_construct_to_dossier'
      post 'set_construct_dossier_quality'
      post 'insert_subpoints'
      post 'add_new_flash'
      post 'map_brainstorm_to_construct'
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
