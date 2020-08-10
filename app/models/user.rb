class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :timeout_in => 8.hours

  has_many :posts

  enum role: {superadmin: 0, admin: 1, visitor: 2}
  enum active: {inactive: 0, active: 1}

  after_initialize :set_defaults, :if => :new_record?
  
  def set_defaults
    self.role ||= :visitor
    self.active ||= :active
  end
end
