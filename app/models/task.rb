class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many_attached :files

  validates :title, presence: true
  validates :status, inclusion: { in: %w[pending in_progress completed] }
  validates :priority, inclusion: { in: %w[low medium high] }

  after_initialize :set_defaults, unless: :persisted?

  private

  def set_defaults
    self.status ||= 'pending'
    self.priority ||= 'medium'
  end
end