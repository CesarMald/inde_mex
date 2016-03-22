class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :model
  belongs_to :collection

  has_many :line_items
end
