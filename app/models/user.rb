class User < ActiveRecord::Base
  ADMIN = "admin"
  PREMIUM = "premium"
  REGULAR = "regular"
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, :role, presence: true
  has_many :orders

  scope :admin, -> { where(role: ADMIN) }
  scope :premium, -> { where(role: PREMIUM) }
  scope :regular, -> { where(role: REGULAR) }

  def complete_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == "ADMIN"
  end

  def regular?
    role == "REGULAR"
  end

  def premium?
    role == "PREMIUM"
  end
end
