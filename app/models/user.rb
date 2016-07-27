class User < ApplicationRecord
  has_secure_password

  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info[:uid]) do |new_user|
      new_user.uid = auth_info.uid
      new_user.first_name = auth_info.info.name
      new_user.email = auth_info.info.email
      new_user.oauth_token = auth_info.credentials.token
    end
    return user if user.save
  end
end
