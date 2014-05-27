class Response < ActiveRecord::Base
	belongs_to :ticket
	validates_presence_of :body
end
