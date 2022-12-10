Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do  
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  get 'about', to: 'static_pages#about'
  get 'delivery', to: 'static_pages#delivery'
  get 'contacts', to: 'static_pages#contacts'

  root to: 'static_pages#about'

  scope module: :user do
    resources :admins, except: %i[index]
    resources :supply_managers, except: %i[index]
    resources :cheifs, except: %i[index]
  end

  scope module: :admins, as: 'admin' do
    resources :departments, except: %i[index show]
  end

  scope module: :cheifs do
    resources :our_companies
  end

  scope module: :supply_managers, as: 'supply_managers' do
    resources :products
  end
  
  scope module: :supply_managers do
    resources :kinds, only: %i[new create edit update]
    resources :suppliers
    resources :receptions
    resources :containers
  end  

  resources :receptions, only: %i[show] do      
    scope module: :receptions, as: 'reception' do 
      resources :line_items, shallow: true
      resources :line_item_containers, shallow: true
    end
  end

  scope module: :suppliers do
    resources :suppliers, only: %i[show] do
      resources :company_contacts, only: %i[new create edit update destroy], shallow: true
    end
  end

  scope module: :our_companies do
    resources :our_companies, only: %i[show] do
      resources :company_contacts, only: %i[new create edit update destroy], shallow: true
    end
  end

  resources :departments, only: %i[index show]
  resources :products, only: %i[index show]
  resources :banks
  resources :kinds, only: %i[index]
end
