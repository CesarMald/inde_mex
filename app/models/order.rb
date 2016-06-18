class Order < ActiveRecord::Base
  IN_PROGRESS = "in_progress"
  COMPLETED = "completed"
  DRAFT = "draft"

  belongs_to :user
  has_many :line_items

  accepts_nested_attributes_for :line_items

  scope :draft, -> { where(status: DRAFT) }
  scope :in_progress, -> { where(status: IN_PROGRESS) }
  scope :completed, -> { where(status: COMPLETED) }
  scope :seen, -> { where(seen: true) }
  scope :unseen, -> { where(seen: false) }


  def draft?
    status == DRAFT
  end

  def in_progress?
    status == IN_PROGRESS
  end

  def completed?
    status = COMPLETED
  end

  def update_total
    self.shipping_price ||= 0.0
    self.tax_price ||= 0.0
    update_column(:subtotal, line_items.sum(:total))
    update_column(:total, shipping_price + tax_price + subtotal)
  end
end
