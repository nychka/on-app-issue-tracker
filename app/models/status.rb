class Status < ActiveRecord::Base
	def self.default_status
		:waiting_for_staff_response
	end
	def self.statuses
		statuses = Hash.new
		self.all.each do |status|
			sym = status.name.gsub("\s", "_").downcase.to_sym
			statuses[sym] = status.id
		end
		statuses
	end
end
