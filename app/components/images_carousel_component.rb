class ImagesCarouselComponent < ViewComponent::Base
  def initialize(images:)
    @images = images
  end
end
