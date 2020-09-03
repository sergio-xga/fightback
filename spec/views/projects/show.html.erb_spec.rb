require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      name: "Name",
      beneficiary: "Beneficiary",
      project_owner_id: 2,
      description: "MyText",
      goal_amount: "9.99",
      project_status: "Project Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Beneficiary/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Project Status/)
  end
end
