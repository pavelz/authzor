require 'redis_shims'

class User 
  include ActiveModel::Validations
  include ActiveModel::SecurePassword
  include RedisShims
  has_secure_password

  [:email, :password_digest, :name].each{|f| attr_accessor f}

  validates :email, presence: true
  validates :password, presence: true, :length => {:within => 6..50}

  alias_method :index, :email

  def self.load(email)
    user = super(email)
    return user if user.nil?

    user.password_digest = user.password
    user
  end

  def save
    return false unless valid?

    save_password = @password
    @password = @password_digest
    super("password_digest")
    @password = save_password
    true
  end
end
