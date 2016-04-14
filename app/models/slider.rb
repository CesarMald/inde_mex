class Slider < ActiveRecord::Base
  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :picture
end
