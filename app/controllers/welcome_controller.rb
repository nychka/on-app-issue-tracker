class WelcomeController < ApplicationController
	layout 'main'
  def index
  	@ticket = Ticket.new
  	@departments = Department.all
  end
end
