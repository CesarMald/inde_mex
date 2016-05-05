class User < ActiveRecord::Base
  ADMIN = "admin"
  PREMIUM = "premium"
  REGULAR = "regular"
  ACTIVE = "active"
  INACTIVE = "inactive"
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, :role, presence: true
  
  has_many :orders

  scope :admin, -> { where(role: ADMIN) }
  scope :premium, -> { where(role: PREMIUM) }
  scope :regular, -> { where(role: REGULAR) }
  scope :active, -> { where(status: ACTIVE) }
  scope :inactive, -> { where(status: INACTIVE) }

  def complete_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == ADMIN
  end

  def regular?
    role == REGULAR
  end

  def premium?
    role == (ADMIN || PREMIUM)
  end

  def active?
    status == ACTIVE
  end
  
  def active_for_authentication?
    super and self.active?
  end

  def inactive_message
    "Tu cuenta todavía no ha sido activada"
  end
end
