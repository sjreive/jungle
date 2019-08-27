class User < ActiveRecord::Base
  has_secure_password

  def  self.authenticate_with_credentials(email, password)
    User.find_by_email(email).try(:authenticate, password) 
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }

end
