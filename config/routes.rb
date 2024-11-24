Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',passwords: 'users/passwords' }

  resources :estates do
    member do
      get 'tenants'
    end
  end

  resources :room_types
  resources :rooms
  resources :tenants
  resources :leases
  resources :payments
  resources :about, only:[:index]
  
  # Add routes for reports
  resources :reports, only: [:index] do
    get :tenant_report, on: :collection
    get :estate_report, on: :collection  # Add route for estate report
  end

  resources :tenants do
    get 'report', to: 'reports#tenant_report', as: 'report'
  end
  # Define the root route
  # root 'estates#index'
  root 'home#index'
end