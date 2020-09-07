class SimpleTableComponent < ViewComponent::Base
  def initialize(headers:, data:)
    @headers = headers
    @data = data
  end
end
