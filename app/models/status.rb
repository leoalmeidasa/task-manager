class Status < ApplicationRecord
  has_many :tasks, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
