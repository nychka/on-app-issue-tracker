json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :sender_name, :sender_email, :subject, :body, :code, :department_id, :owner_id, :status_id
  json.url ticket_url(ticket, format: :json)
end
