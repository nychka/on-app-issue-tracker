class Ticket < ActiveRecord::Base
	#has_one :status
	has_many :responses
	validates_presence_of :sender_name
	validates_presence_of :sender_email
	validates_presence_of :subject
	validates_presence_of :body
	
	def to_param
		code
	end
	def self.find(s)
		self.find_by_code(s)
	end
	def self.add(ticket_params)
		#generate code
		ticket = Ticket.new(ticket_params)
		ticket.code = generate_code
		ticket.status = Status.default_status
		ticket.save
		ticket
	end
	def status=(id)
		self.status_id = id
	end
	private
	def self.generate_code(count = 2)
		#ABC-123-HGH-565
		str = String.new
		count.times do |n|
			str += ('A'..'Z').to_a.shuffle.last(3).join("")
			str += "-"
			str += (0..9).to_a.shuffle.last(3).join("")
			str += "-" unless count == n + 1
		end
		str
	end
end
