class Response < ActiveRecord::Base
	belongs_to :ticket
	validates_presence_of :body
	def author
		User.find(sender) if sender
	end
end
