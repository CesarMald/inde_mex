class InteriorBuilder < ActiveRecord::Base
  validates :title, :description, :url_link, presence: true

  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :picture, allow_destroy: true

  def first_title
    title.chars.each_slice(19).map(&:join).first
  end

  def last_title
    title.chars.each_slice(19).map(&:join).last
  end

  def first_description
    description.chars.each_slice(59).map(&:join).first
  end

  def last_description
    description.chars.each_slice(59).map(&:join).last
  end

  def main_picture
    if picture
      picture.image_url
    else
      "default-banner.jpg"
    end
  end

end
