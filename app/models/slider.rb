class Slider < ActiveRecord::Base
  has_one :picture, as: :picturable, dependent: :destroy

  validates :title, :url_link, :link_text, presence: true

  accepts_nested_attributes_for :picture

  def main_picture
    if picture
      picture.image_url
    else
      "default-slider.jpg"
    end
  end
end
