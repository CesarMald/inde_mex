class Slider < ActiveRecord::Base
  has_one :picture, as: :picturable, dependent: :destroy

  validates :title, :url_link, :link_text, presence: true

  accepts_nested_attributes_for :picture

  def first_title
    title.chars.each_slice(30).map(&:join).first
  end

  def last_title
    title.chars.each_slice(30).map(&:join).last
  end

  def first_description
    description.chars.each_slice(30).map(&:join).first
  end

  def last_description
    description.chars.each_slice(30).map(&:join).last
  end

  def main_picture
    if picture
      picture.image_url
    else
      "default-slider.jpg"
    end
  end
end
