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
    resources :admins
    resources :supply_managers
  end

  scope module: :admins, as: 'admin' do
    resources :departments, except: %i[index show]
  end

  scope module: :supply_managers, as: 'supply_managers' do
    resources :kinds
    resources :products
  end

  scope module: :supply_managers do
    resources :suppliers
  end

  scope module: :companies do
    resources :companies, only: %i[show] do
      resources :company_contacts, only: %i[new create edit update destroy], shallow: true
    end
  end
  
  resources :departments, only: %i[index show]
  resources :products, only: %i[index show]
  resources :banks

end
