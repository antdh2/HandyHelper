json.array!(@offers) do |offer|
  json.extract! offer, :id, :price, :status, :is_accepted
  json.url offer_url(offer, format: :json)
end
