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
  belongs_to :user
  attr_accessible :order

  def seller_dues=(value)
    self[:seller_dues] = value
  end

  def seller_dues
    self[:seller_dues] ||= calculate_seller_dues
  end

  private

    def calculate_seller_dues
      self[:seller_dues] = (self.order.total * 0.08).round(2)
    end

end
