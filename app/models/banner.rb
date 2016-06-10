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

  def main_picture
    if picture
      picture.image_url
    else
      "default-banner.jpg"
    end
  end

end
