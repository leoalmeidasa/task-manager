class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
