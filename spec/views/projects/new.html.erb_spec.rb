require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      name: "MyString",
      beneficiary: "MyString",
      project_owner_id: 1,
      description: "MyText",
      goal_amount: "9.99",
      project_status: "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[name]"

      assert_select "input[name=?]", "project[beneficiary]"

      assert_select "input[name=?]", "project[project_owner_id]"

      assert_select "textarea[name=?]", "project[description]"

      assert_select "input[name=?]", "project[goal_amount]"

      assert_select "input[name=?]", "project[project_status]"
    end
  end
end
