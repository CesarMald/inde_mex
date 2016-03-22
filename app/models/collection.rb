class Collection < ActiveRecord::Base
  validates :name, :text_link, :url_link, presence: true
  has_many :products
end
