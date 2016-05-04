class Banner < ActiveRecord::Base
  COMPLETE = "complete"
  HALF = "half"

  validates :title, :description, :position, presence: true

  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :picture, allow_destroy: true

  scope :complete, -> { where(banner_type: COMPLETE) }
  scope :half, -> { where(banner_type: HALF) }

  def complete?; banner_type == COMPLETE; end
  def half?; banner_type == HALF; end

  def first_title
    title.chars.each_slice(19).map(&:join).first
  end

  def last_title
    title.chars.each_slice(19).map(&:join).last
  end

  def first_description
    description.chars.each_slice(59).map(&:join).first
  end

  def last_description
    description.chars.each_slice(59).map(&:join).last
  end

end
