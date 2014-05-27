class UserMailer < ActionMailer::Base
	default from: "from@example.com"

	def welcome(ticket)
		@ticket = ticket
		mail(to: @ticket.sender_email, subject: 'Welcome to my awesome site')
	end
	def notify_about_response(ticket)
		@ticket = ticket
		@response = @ticket.responses.last
		mail(to: @ticket.sender_email, subject: 'You have a new response!')
	end
end
