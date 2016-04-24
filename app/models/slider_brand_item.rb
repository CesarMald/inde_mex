class SliderBrandItem < ActiveRecord::Base
  belongs_to :slider, class_name: "SliderBrand"
  belongs_to :brand
  has_one :picture, as: :picturable, dependent: :destroy

  validates :slider, :brand, :url_link, presence: true

  accepts_nested_attributes_for :picture
end
