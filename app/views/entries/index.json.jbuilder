json.array!(@entries) do |entry|
  json.extract! entry, :slug
  json.url entry_url(entry, format: :json)
end
