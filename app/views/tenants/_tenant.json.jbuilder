json.extract! tenant, :id, :first_name, :last_name, :email, :home_district, :village, :next_of_kin, :room_id, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
