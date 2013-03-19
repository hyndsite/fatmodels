# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tax        :decimal(8, 2)
#  total      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :tax, :total
  belongs_to :user
  has_one :seller_transaction
  has_many :order_lines




end
