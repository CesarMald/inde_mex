class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  has_many :orders

  def complete_name
    "#{first_name} #{last_name}"
  end
end
