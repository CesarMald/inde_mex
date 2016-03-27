class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :model
  belongs_to :collection

  validates :name, :code, :brand, :model, :collection, :regular_price, :offer_price, presence: true
  has_many :line_items
end
