class Brand < ActiveRecord::Base
  validates :name, presence: true
  has_many :models, dependent: :destroy
  has_many :products, through: :models

  default_scope { order(:name) } 
end
