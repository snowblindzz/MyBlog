class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authentications         


def apply_omniauth(omni)
 authentications.build(:provider => omni['provider'],
 :uid => omni['uid'],
 :token => omni['credentials'].token,
 :secret => omni['credentials'].secret)
 end
def password_required?
(authentications.empty? || !password.blank?) && super
end

end
