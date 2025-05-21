class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many_attached :attachments
  belongs_to :status
  belongs_to :priority

  validates :title, :status, :priority, :user, :due_date, presence: true
  validate :status_name_must_be_valid
  validate :priority_level_must_be_valid
  validate :due_date_not_in_past

  private

  def due_date_not_in_past
    return unless due_date.present?
    if due_date < Date.today
      errors.add(:due_date, :not_in_past)
    end
  end

  def priority_level_must_be_valid
    allowed_levels = %w[low medium high]
    if priority && !allowed_levels.include?(priority.level)
      errors.add(:priority, "deve ser low, medium ou high")
    end
  end

  def status_name_must_be_valid
    allowed_names = %w[pending in_progress completed]
    if status && !allowed_names.include?(status.name)
      errors.add(:priority, "deve ser low, medium ou high")
    end
  end
end
