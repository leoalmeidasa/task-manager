class Priority < ApplicationRecord
  has_many :tasks, dependent: :nullify

  validates :level, presence: true, uniqueness: true
end
