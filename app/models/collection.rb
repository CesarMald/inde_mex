class Collection < ActiveRecord::Base
  validates :name, :text_link, :url_link, presence: true

  has_many :products
  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :picture, allow_destroy: true

  default_scope { order(:name) } 

  def main_picture
    if picture
      picture.image_url
    else
      "default-collection.jpg"
    end
  end
end
