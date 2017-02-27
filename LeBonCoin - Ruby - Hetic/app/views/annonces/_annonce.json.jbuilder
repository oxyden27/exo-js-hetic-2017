json.extract! annonce, :id, :title, :description, :price, :category_id, :created_at, :updated_at
json.url annonce_url(annonce, format: :json)