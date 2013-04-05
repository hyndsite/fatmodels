# == Schema Information
#
# Table name: order_lines
#
#  id         :integer          not null, primary key
#  product_id :integer
#  qty        :integer
#  line_total :decimal(, )
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderLine < ActiveRecord::Base
  attr_accessible :order, :product, :qty
  belongs_to :order
  belongs_to :product

  after_initialize :init

  validates :order, presence: true
  validates :product, presence: true
  validates :qty, presence: true

  def init
    self.qty ||= 1
  end

  def line_total
      self.product.price * self.qty
  end
end
