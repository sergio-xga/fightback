class BootstrapTableComponent < ViewComponent::Base
  def initialize(headers:, data:, search:, pagination:, model:)
    @headers = headers
    @data = data
    @search = search
    @pagination = pagination
    @model = model
  end
end
