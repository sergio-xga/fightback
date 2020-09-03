require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        name: "Name",
        beneficiary: "Beneficiary",
        project_owner_id: 2,
        description: "MyText",
        goal_amount: "9.99",
        project_status: "Project Status"
      ),
      Project.create!(
        name: "Name",
        beneficiary: "Beneficiary",
        project_owner_id: 2,
        description: "MyText",
        goal_amount: "9.99",
        project_status: "Project Status"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Beneficiary".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Project Status".to_s, count: 2
  end
end
