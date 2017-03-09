json.extract! order, :id, :name, :email, :bill_amount, :created_at, :updated_at
json.url order_url(order, format: :json)
