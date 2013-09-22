class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds
  has_many :guesses, through: :rounds

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)

  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil
  end
end
