class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, :total, presence: true
end
