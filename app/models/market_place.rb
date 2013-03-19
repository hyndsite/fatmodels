# == Schema Information
#
# Table name: market_places
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class MarketPlace < ActiveRecord::Base
  attr_accessible :products, :user, :name
  has_many :products
  belongs_to :user

  VALID_MARKET_NAME_REGEX = /^\A[\w+\-.]+[\w\s\-\_]+$/i
  validates :name, presence: true, length: { maximum: 20},
                            format: {with: VALID_MARKET_NAME_REGEX},
                            uniqueness: {case_sensitive: false}


   before_save {|market_place| market_place.name.downcase}
end
