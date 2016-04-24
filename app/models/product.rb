class Product < ActiveRecord::Base

  has_one :brand, through: :model
  belongs_to :collection
  belongs_to :model
  has_many :line_items
  has_and_belongs_to_many(:related_products, join_table: "product_connections", foreign_key: "product_a_id", association_foreign_key: "product_b_id", class_name: "Product")
  has_many :pictures, as: :picturable, dependent: :destroy

  validates :name, :code, :brand, :collection, :regular_price, :offer_price, :premium_price, presence: true


  scope :on_offer, -> { where(on_offer: true) }
  scope :regular, -> { where(on_offer: false) }
end
