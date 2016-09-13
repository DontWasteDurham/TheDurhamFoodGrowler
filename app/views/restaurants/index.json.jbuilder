json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :box_inventory
  json.url restaurant_url(restaurant, format: :json)
end
