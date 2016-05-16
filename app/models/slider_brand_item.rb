class SliderBrandItem < ActiveRecord::Base
  belongs_to :slider, class_name: "SliderBrand"
  belongs_to :brand
  has_one :picture, as: :picturable, dependent: :destroy

  validates :slider, :brand, presence: true

  accepts_nested_attributes_for :picture

  def main_picture
    if picture
      picture.image_url
    else
      "default-slider.jpg"
    end
  end
end
