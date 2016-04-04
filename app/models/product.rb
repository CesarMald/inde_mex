class Product < ActiveRecord::Base
  belongs_to :collection
  belongs_to :model
  has_one :brand, through: :model
  has_many :line_items

  validates :name, :code, :brand, :collection, :regular_price, :offer_price, presence: true
end
