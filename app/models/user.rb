class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  before_create :generate_token

  attr_accessible :email,
                  :password
                  :score

  def self.authenticate!(auth_token)
    self.find_by_auth_token(auth_token)
  end

  private
  def generate_token
    token = SecureRandom.uuid
    self.auth_token = token
  end

end
