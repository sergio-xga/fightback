class BootstrapTableComponent < ViewComponent::Base
  def initialize(headers:, data:, search:, pagination:)
    @headers = headers
    @data = data
    @search = search
    @pagination = pagination
  end
end
