class Model < ActiveRecord::Base
  validates :name, presence: true
  has_many :products

  default_scope { order(:name) } 
end
