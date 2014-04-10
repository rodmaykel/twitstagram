json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :subject_id, :tweet, :created, :photo
  json.url tweet_url(tweet, format: :json)
end
