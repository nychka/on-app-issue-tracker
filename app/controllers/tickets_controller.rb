class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :destroy]
  # GET /tickets
  # GET /tickets.json
  def index
    if params[:status] 
      status = params[:status].to_sym
      if Status.statuses.has_key? status
        status_id = Status.statuses[status] 
        @tickets = Ticket.where(status_id: status_id)
      end
    elsif params[:search]
      search = Ticket.search{fulltext params[:search]}
      @tickets = search.results
    else
      @tickets = Ticket.all
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @response = Response.new
    @responses = @ticket.responses
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @departments = Department.all
  end

  # GET /tickets/1/edit
  def edit
    @departments = Department.all
    @users = User.all
    @statuses = Status.all
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.add(ticket_params)

    respond_to do |format|
      if @ticket
        UserMailer.welcome(@ticket).deliver
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:sender_name, :sender_email, :subject, :body, :code, :department_id, :status_id, :owner_id)
    end
  end
