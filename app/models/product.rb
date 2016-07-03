class Product < ActiveRecord::Base
  OTHER_COLORS = "other_colors"
  YOU_MAY_ALSO_LIKE = "you_may_also_like"
  BOTH = "both"

  has_one :brand, through: :model
  belongs_to :collection
  belongs_to :model
  has_many :line_items
  has_and_belongs_to_many(:related_products, join_table: "product_connections", foreign_key: "product_a_id", association_foreign_key: "product_b_id", class_name: "Product")
  has_and_belongs_to_many(:similar_products, join_table: "similar_products", foreign_key: "product_a_id", association_foreign_key: "product_b_id", class_name: "Product")
  has_many :pictures, as: :picturable, dependent: :destroy

  before_validation :set_offer_price_as_zero

  validates :name, :code, :brand, :collection, :regular_price, :offer_price, :premium_price, presence: true


  scope :on_offer, -> { where(on_offer: true) }
  scope :regular, -> { where(on_offer: false) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(inactive: false) } 

  def main_picture
    if pictures.empty?
      "default-product.jpg"
    else
      pictures.first.image_url
    end
  end

  def can_be_activated?
    brand.active? && model.active?
  end

  private

  def set_offer_price_as_zero
    self.offer_price ||= 0.0
  end
end
