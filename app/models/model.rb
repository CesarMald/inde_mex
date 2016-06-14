class Model < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :brand
  has_many :products
  has_one :picture, as: :picturable, dependent: :destroy
  
  accepts_nested_attributes_for :picture, allow_destroy: true

  default_scope { order(:name) }
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }  

  def main_picture
    if picture
      picture.image_url
    else
      "default-product.png"
    end
  end
end
