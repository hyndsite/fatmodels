class User < ActiveRecord::Base
  attr_accessible :name
  has_many :market_places
  has_many :products, through: :market_places
  has_many :orders

  def is_buyer?
    orders.present?
  end

  def is_seller?
    market_places.present?
  end
end
