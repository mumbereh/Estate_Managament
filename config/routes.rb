Rails.application.routes.draw do
  # Estate routes with custom tenant filtering
  resources :estates do
    member do
      get 'tenants' # Generates estates/:id/tenants
    end
  end

  # Resources for tenants, room types, rooms, leases, and payments
  resources :room_types
  resources :rooms
  resources :tenants
  resources :leases
  resources :payments

  # Custom report routes
  get 'reports', to: 'reports#index'
  get 'reports/tenant_report/:tenant_id', to: 'reports#tenant_report', as: 'tenant_report'

  # Set the root path
  root 'estates#index'
end
