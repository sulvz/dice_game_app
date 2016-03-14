class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  before_create :generate_token

  attr_accessible :email,
                  :password

  private
  def generate_token
    token = SecureRandom.uuid
    self.auth_token = token
  end

end
