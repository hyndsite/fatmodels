# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  price           :decimal(8, 2)
#  decimal         :decimal(8, 2)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  market_place_id :integer
#

class Product < ActiveRecord::Base
  attr_accessible :name, :price
  belongs_to :market_place

  VALID_PROD_NAME_REGEX = /^\A[\w+\-.]+[\w\s\-\_]+$/i
  validates :name, presence: true, length: { maximum: 30},
                            format: {with: VALID_PROD_NAME_REGEX},
                            uniqueness: {case_sensitive: false}


  before_save {|product| product.name.downcase}
end
