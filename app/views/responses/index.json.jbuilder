json.array!(@responses) do |response|
  json.extract! response, :id, :body, :sender
  json.url response_url(response, format: :json)
end
