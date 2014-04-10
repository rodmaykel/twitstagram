json.array!(@subjects) do |subject|
  json.extract! subject, :id, :twitter, :instagram, :name, :photo_url
  json.url subject_url(subject, format: :json)
end
