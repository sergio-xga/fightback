class ProgressBarComponent < ViewComponent::Base
  def initialize(goal:, current_amount:)
    @goal = goal
    @current_amount = current_amount
  end
end
