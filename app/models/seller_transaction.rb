# == Schema Information
#
# Table name: seller_transactions
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  seller_dues :decimal(8, 2)
#  points      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SellerTransaction < ActiveRecord::Base
  belongs_to :order
  attr_accessible :order

  before_save :calculate_seller_dues

  def calculate_seller_dues
    self.seller_dues = (self.order.total * 0.08).round(2)
  end

  def seller_dues
    self.seller_dues = (self.order.total * 0.08).round(2)
  end

end
