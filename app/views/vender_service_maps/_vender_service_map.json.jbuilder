json.extract! vender_service_map, :id, :vendor_id, :service_id, :vehicle_id, :commission, :is_inclusive, :active, :created_at, :updated_at
json.url vender_service_map_url(vender_service_map, format: :json)