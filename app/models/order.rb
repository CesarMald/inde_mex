class Order < ActiveRecord::Base
  IN_PROGRESS = "in_progress"
  COMPLETED = "completed"

  belongs_to :user
  has_many :line_items

  scope :in_progress, -> { where(status: IN_PROGRESS) }
  scope :completed, -> { where(status: COMPLETED) }

  def in_progress?
    status == IN_PROGRESS
  end

  def completed?
    status = COMPLETED
  end
end
