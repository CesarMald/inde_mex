class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, :total, :product_id, presence: true
end
