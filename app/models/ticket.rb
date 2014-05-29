class Ticket < ActiveRecord::Base
	has_many :responses, dependent: :destroy

	validates_presence_of :sender_name
	validates_presence_of :sender_email
	validates_presence_of :subject
	validates_presence_of :body

	searchable do
		text :code
		text :subject
		text :body
		#text :subject
		#text :body
	end
	
	def to_param
		code
	end
	def self.find(s)
		self.find_by_code(s)
	end
	def department
		Department.find(self.department_id).name
	end
	def owner
		(owner_id)? User.find(owner_id).email : 'no owner'
	end
	def self.add(ticket_params)
		#generate code
		ticket = Ticket.new(ticket_params)
		ticket.code = generate_code
		ticket.status = Status.default_status
		ticket.save
		ticket
	end
	def current_status
		Status.statuses.each do |key, value|
			return key if value == self.status_id
		end
	end
	def toggle_status
		case current_status
		when :waiting_for_staff_response
			if has_staff_response?
				self.status = :waiting_for_customer
				self.save
			end
		when :waiting_for_customer	
			if has_customer_response?
				self.status = :waiting_for_staff_response
				self.save
			end
		end
	end
	def has_staff_response?
		self.responses.last.sender
	end
	def has_customer_response?
		true unless has_staff_response?
	end
	def status
		Status.find(self.status_id).name
	end
	def status=(status)
		if status.is_a? Symbol and Status.statuses.has_key? status
			id = Status.statuses[status]
		elsif status.is_a? Fixnum
			id = status
		else
			raise ArgumentError, "status is wrong"
		end
		self.status_id = id
	end
	private
	def self.generate_code(count = 2)
		str = String.new
		count.times do |n|
			str += ('A'..'Z').to_a.shuffle.last(3).join("")
			str += (0..9).to_a.shuffle.last(3).join("")
		end
		str
	end
end
