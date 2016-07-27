class User < ApplicationRecord
  has_secure_password validations: false, if: "uid"
  validates :email, confirmation: true, if: "uid.nil?", on: :create
  validates :email_confirmation, presence: true, if: "uid.nil?", on: :create
  validates :password, presence: true, confirmation: true, if: "uid.nil?", on: :create
  validates :password_confirmation, presence: true, if: "uid.nil?", on: :create

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
