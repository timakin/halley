json.array!(@databoxes) do |databox|
  json.extract! databox, :title, :description
  json.url databox_url(databox, format: :json)
end
