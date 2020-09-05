class ModalComponent < ViewComponent::Base
  def initialize(title:, modal_id:, body_message:,
    confirm_button_text:, confirm_button_action:)
    @title = title
    @modal_id = modal_id
    @body_message = body_message
    @confirm_button_text = confirm_button_text
    @confirm_button_action = confirm_button_action
  end
end
