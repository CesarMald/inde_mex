class Slider < ActiveRecord::Base
  has_one :picture, as: :picturable, dependent: :destroy

  validates :title, :url_link, :link_text, presence: true, on: :update

  accepts_nested_attributes_for :picture
end
