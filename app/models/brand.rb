class Brand < ActiveRecord::Base
  validates :name, presence: true
  has_many :models, dependent: :destroy
  has_many :products, through: :models

  default_scope { order(:name) }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
