class Project < ApplicationRecord
  has_many_attached :images
  has_many :donations
  belongs_to :owner, foreign_key: 'project_owner_id', class_name: 'User'
end
