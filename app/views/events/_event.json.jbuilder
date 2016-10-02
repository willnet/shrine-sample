json.extract! event, :id, :name, :image_data, :created_at, :updated_at
json.url event_url(event, format: :json)