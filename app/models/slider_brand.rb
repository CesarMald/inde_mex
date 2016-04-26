class SliderBrand < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :items, class_name: "SliderBrandItem", foreign_key: "slider_id", dependent: :destroy
  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :items, :picture, allow_destroy: true

  def first_description
    description.chars.each_slice(30).map(&:join).first
  end

  def last_description
    description.chars.each_slice(30).map(&:join).last
  end
end
