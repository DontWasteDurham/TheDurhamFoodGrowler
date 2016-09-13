json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :restaurant_id, :user_id, :number_of_boxes, :returned, :taken
  json.url transaction_url(transaction, format: :json)
end
