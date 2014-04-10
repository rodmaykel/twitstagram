json.array!(@insta) do |instum|
  json.extract! instum, :id, :subject_id, :created, :photo, :caption
  json.url instum_url(instum, format: :json)
end
