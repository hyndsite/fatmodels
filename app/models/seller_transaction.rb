class SellerTransaction < ActiveRecord::Base
  belongs_to :order
  attr_accessible :points, :seller_dues
end
