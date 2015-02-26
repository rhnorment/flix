class User < ActiveRecord::Base

  has_secure_password

  validates         :name,      :email, presence: true
  validates         :email,     format: { with: /\A\S+@\S+\z/ }
  validates         :email,     uniqueness: { case_sensitive: false }

  has_many          :reviews,     dependent: :destroy
  has_many          :favorites,   dependent: :destroy
  has_many          :favorite_movies, through: :favorites,  source: :movie

  scope             :by_name,     -> { order(:name) }
  scope             :not_admins,  -> { by_name.where(admin: false) }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

end
