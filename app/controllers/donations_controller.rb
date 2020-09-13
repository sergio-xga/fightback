class DonationsController < WebAppController
  before_action :get_project

  def create
    sleep 5 # To simulate a real transaction
    @donation = @project.donations.new(donation_params)
    @donation.user = current_user if logged_in? # Otherwise it will be an anonymous donation
    respond_to do |format|
      if @donation.save
        format.json { render json: {donation: @donation, user: current_user, current_amount: @project.donations.sum(:amount)} }
      else
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def get_project
    @project = Project.find(params[:project_id])
  end
  def donation_params
    params.require(:donation).permit(:amount, :payment_method, :project_id, :transaction_status)
  end
end