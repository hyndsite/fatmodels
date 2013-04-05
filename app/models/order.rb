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
  attr_accessible :seller_transaction
  belongs_to :user
  has_one :seller_transaction
  has_many :order_lines

  validates :user, presence: true
  validates :seller_transaction, presence: true
  validates :order_lines , presence: true

  def total
     self.order_lines.nil? ? 0
                                  : self.order_lines.empty? ? 0
                                  : self.order_lines.inject(0) {|sum, line| sum += line.line_total}
  end
end
