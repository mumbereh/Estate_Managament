Rails.application.routes.draw do
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
  
  # Add routes for reports
  get 'reports', to: 'reports#index'
  get 'reports/tenant_report/:tenant_id', to: 'reports#tenant_report', as: 'tenant_report'

  # Define the root route
  root 'estates#index'
end

