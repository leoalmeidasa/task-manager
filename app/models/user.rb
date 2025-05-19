class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :projects, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :member_projects, through: :project_members, source: :project
  has_many :tasks, dependent: :nullify
end