Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  scope '/admin' do
    resources :collections
    resources :users do
      get 'edit_password', on: :member
      put 'update_password', on: :member
    end
    resources :orders do
      get 'complete', on: :member
      get 'send_to_client', on: :member
    end
    resources :models, except: :destroy do
      get 'activate', on: :member
      get 'deactivate', on: :member
    end
    resources :brands, except: :destroy do
      get 'search_models', on: :member
      get 'activate', on: :member
      get 'deactivate', on: :member
    end
    resources :products, except: :destroy do
      get 'activate', on: :member
      get 'deactivate', on: :member
      resources :related_products, path: 'related' 
    end
    resources :pictures, only: [:create, :destroy]
    resources :sliders, only: [:index, :update]
    resources :slider_brands, only: [:index, :update]
    resources :banners, only: [:show, :update], param: :position
    resources :interior_builders, param: :position
    resources :offer_builders
    resources :newsletter_builders
  end
  root 'home#index'
  get 'brand/:id' => 'home#brand_section', as: :brand_section
  get 'marcas' => 'home#brands_section', as: :brands_section
  get 'models/:id' => 'home#model_section', as: :model_section
  get 'colecciones' => 'home#collections_section', as: :collections_section
  get 'coleccion/:id' => 'home#collection_section', as: :collection_section
  get 'lo_mas_nuevo' => 'home#newest_section', as: :newest_section
  get 'producto/:id' => 'home#product_section', as: :product_section
  get 'oferta' => 'home#offer_section', as: :offer_section
  get 'contactanos' => 'home#contact_section', as: :contact_section
  get 'search_section' => 'home#search_section', as: :search_section
  get 'make_contact' => 'home#make_contact', as: :make_contact
  
  resources :newsletters, only: [:create, :index, :destroy]
  resources :customers, only: [:edit, :update]

  resources :carts do
    get 'checkout', on: :member
    get 'detail', on: :member
    get 'complete', on: :member
    resources :line_items
    get 'add_line_item', on: :member
    get 'remove_line_item', on: :member
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
