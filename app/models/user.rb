class User < ActiveRecord::Base
  ADMIN = "admin"
  REGULAR = "regular"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, :role, presence: true
  has_many :orders

  def complete_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == "ADMIN"
  end

  def regular?
    role == "REGULAR"
  end
end
