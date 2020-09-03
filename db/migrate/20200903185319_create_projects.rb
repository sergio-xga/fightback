class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :beneficiary
      t.integer :project_owner_id
      t.text :description
      t.decimal :goal_amount, precision: 10, scale: 2
      t.date :goal_deadline
      t.string :project_status

      t.timestamps
    end
  end
end
