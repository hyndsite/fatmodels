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
  attr_accessible :points, :seller_dues
end
