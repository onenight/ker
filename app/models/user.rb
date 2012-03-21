class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :posts
  
  attr_protected :admin
  
  def admin?
    is_admin
  end
  
  def has_role?(role)
    case role
    when :admin then admin?
    when :member then true
    else false
    end
  end
end
