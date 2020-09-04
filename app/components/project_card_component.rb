class ProjectCardComponent < ViewComponent::Base
  def initialize(project:)
    @project = project
  end
end
