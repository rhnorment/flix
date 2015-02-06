class User < ActiveRecord::Base

  has_secure_password

  validates         :name,  :email, presence: true

  validates         :email, format: { with: /\A\S+@\S+\z/ }

  validates         :email, uniqueness: { case_sensitive: false }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

end
