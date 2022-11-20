Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'static_pages/about'
  get 'static_pages/delivery'
  get 'static_pages/contacts'

  root to: "products#index"
end
