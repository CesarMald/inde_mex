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

end
