class ModalComponent < ViewComponent::Base
  def initialize(title:, modal_id:, body_message:,
    confirm_button_text:, confirm_data_action:, confirm_button_id:)
    @title = title
    @modal_id = modal_id
    @body_message = body_message
    @confirm_button_text = confirm_button_text
    @confirm_data_action = confirm_data_action
    @confirm_button_id = confirm_button_id
  end
end
