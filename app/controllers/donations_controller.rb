class DonationsController < ApplicationController
  before_action :get_project

  def create
    sleep 5 # To simulate a real transaction
    @donation = @project.donations.create(donation_params)
    respond_to do |format|
      format.json { render json: {donation: @donation,current_amount: @project.donations.sum(:amount)} }
    end
  end
  
  private
  def get_project
    @project = Project.find(params[:project_id])
  end
  def donation_params
    params.require(:donation).permit(:amount, :payment_method, :project_id, :transaction_status, :user_id)
  end
end