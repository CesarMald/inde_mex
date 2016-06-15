class Slider < ActiveRecord::Base
  has_one :picture, as: :picturable, dependent: :destroy

  validates :url_link, presence: true

  accepts_nested_attributes_for :picture

  def main_picture
    if picture
      picture.image_url
    else
      "default-slider.jpg"
    end
  end
end
