class Project < ApplicationRecord
  has_many_attached :images
  has_many :donations
end
