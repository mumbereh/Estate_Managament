json.extract! room, :id, :room_number, :price, :room_type_id, :created_at, :updated_at
json.url room_url(room, format: :json)
