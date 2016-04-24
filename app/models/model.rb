class Model < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :brand
  has_many :products
  has_one :picture, as: :picturable, dependent: :destroy
  
  accepts_nested_attributes_for :picture, allow_destroy: true

  default_scope { order(:name) } 
end
