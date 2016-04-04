class Brand < ActiveRecord::Base
  validates :name, presence: true
  has_many :models
  has_many :products, through: :models

  default_scope { order(:name) } 
end
