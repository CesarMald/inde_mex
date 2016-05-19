class OfferBuilder < ActiveRecord::Base

  has_one :picture, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true

  def main_picture
    if picture
      picture.image_url
    else
      "default-banner.jpg"
    end
  end
end
