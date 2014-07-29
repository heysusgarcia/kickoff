# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  email                      :string(255)      not null
#  password_digest            :string(255)      not null
#  session_token              :string(255)      not null
#  location                   :string(255)
#  biography                  :text
#  website                    :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  profile_photo_file_name    :string(255)
#  profile_photo_content_type :string(255)
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#

class User < ActiveRecord::Base
  validates :name, :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  has_attached_file :profile_photo,
                    styles: { medium: "300x300>", thumb: "100x100>" } 
  validates_attachment_content_type :profile_photo,
     content_type: ["image/jpeg", "image/png", "image/jpg"]


  has_many :started_projects, class_name: "Project", foreign_key: :founder_id
  has_many :followed_projects, class_name: "ProjectFollowing",
            foreign_key: :follower_id
  has_many :backed_projects, class_name: "ProjectFunding",
            foreign_key: :funder_id

  def self.find_by_credentials(credentials)
    user = User.find_by_email(credentials[:email])
    return nil if user.nil?
    return user if user.is_password?(credentials[:password])
    return nil
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
