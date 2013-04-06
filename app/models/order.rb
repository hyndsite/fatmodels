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
  attr_accessible :seller_transaction, :order_lines_attributes
  belongs_to :user, inverse_of: :orders
  has_one :seller_transaction, inverse_of: :order
  has_many :order_lines, inverse_of: :order, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :order_lines, allow_destroy: true

  validates :user, presence: true
  validates :seller_transaction, presence: true
  validates :order_lines , presence: true

  def total
     self.order_lines.nil? ? 0
                                  : self.order_lines.empty? ? 0
                                  : self.order_lines.inject(0) {|sum, line| sum += line.line_total}
  end
end
