class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :market_places
  has_many :products, through: :market_places
  has_many :orders

  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50}
  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                            uniqueness: {case_sensitive: false}

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token


  def is_buyer?
    orders.present?
  end

  def is_seller?
    market_places.present?
  end
end
