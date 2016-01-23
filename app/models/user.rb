class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  after_create :update_access_token!

  has_many :stories

  validates :username, :email, presence: true

private

  def update_access_token!
    self.access_token = generate_access_token
    save
  end

  def generate_access_token
    loop do
      token = "#{self.id}:#{Devise.friendly_token}"
      break token unless User.where(access_token: token).first
    end
  end
end
