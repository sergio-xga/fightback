class WebAppController < ActionController::Base
  # Include Login methods
  include WebAppHelper
  layout 'application'
  def landing
  end
end