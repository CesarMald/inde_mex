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
  has_one :picture, as: :picturable, dependent: :destroy
  
  accepts_nested_attributes_for :picture, allow_destroy: true

  scope :admin, -> { where(role: ADMIN) }
  scope :premium, -> { where(role: PREMIUM) }
  scope :regular, -> { where(role: REGULAR) }
  scope :active, -> { where(status: ACTIVE) }
  scope :inactive, -> { where(status: INACTIVE) }
  scope :by_name, -> { order(:first_name) }
  

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
    role == ADMIN || role == PREMIUM
  end

  def premium_or_regular?
    regular? || premium?
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

  def profile_picture
    if picture
      picture.image_url
    else
      "profile_small.jpg"
    end
  end
end
