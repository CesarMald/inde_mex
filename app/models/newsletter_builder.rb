class NewsletterBuilder < ActiveRecord::Base

  validates :title, :description, :text_link, presence: true

  has_one :picture, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true

  def main_picture
    if picture
      picture.image_url
    else
      "newsletter.jpg"
    end
  end

  def first_title
    title.chars.each_slice(27).map(&:join).first
  end

  def last_title
    title.chars.each_slice(27).map(&:join).last
  end

  def first_description
    description.chars.each_slice(50).map(&:join).first
  end

  def last_description
    description.chars.each_slice(50).map(&:join).last
  end
end
