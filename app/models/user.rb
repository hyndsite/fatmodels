# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :tax_rate, :orders_attributes, :orders
  has_many :market_places
  has_many :products, through: :market_places
  has_many :orders, inverse_of: :user, autosave: true
  accepts_nested_attributes_for :orders

  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                            uniqueness: {case_sensitive: false}

  before_save { |user| user.email = user.email.downcase }


  def is_buyer?
    orders.present?
  end

  def is_seller?
    market_places.present?
  end

  def has_orders?
    self.orders.empty?
  end

  def has_seller_transactions?
    return false if self.orders.empty?

    self.orders.each do |order|
      return true unless order.has_seller_transaction.nil?
    end
  end
end
