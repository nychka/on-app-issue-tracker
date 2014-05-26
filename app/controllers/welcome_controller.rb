class WelcomeController < ApplicationController
  def index
  	@ticket = Ticket.new
  	@departments = Department.all
  end
end
