class OrderLine < ActiveRecord::Base
  attr_accessible :order, :product, :qty
  belongs_to :order
  belongs_to :product

  validates :order, presence: true
  validates :product, presence: true
  validates :qty, presence: true

  def line_total
      @product.price * qty
  end
end
