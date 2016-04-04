class Model < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :brand
  has_many :products

  default_scope { order(:name) } 
end
