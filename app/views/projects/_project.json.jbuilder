json.extract! project, :id, :name, :beneficiary, :project_owner_id, :description, :goal_amount, :goal_deadline, :project_status, :created_at, :updated_at
json.url project_url(project, format: :json)
