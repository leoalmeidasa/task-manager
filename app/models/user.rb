class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato inválido" }
  validates :password, presence: true,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  has_many :projects, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :member_projects, through: :project_members, source: :project
  has_many :tasks, dependent: :nullify
end