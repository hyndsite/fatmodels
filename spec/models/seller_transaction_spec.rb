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

require 'spec_helper'

describe SellerTransaction do
  before do
    order = FactoryGirl.create(:order)
    order.order_lines.create(product: FactoryGirl.create(:product, price: 10), qty: 3, order: @order)
    order.order_lines.create(product: FactoryGirl.create(:product, price: 5), qty: 1, order: @order)
    @seller_transaction = FactoryGirl.create(:seller_transaction, order: order)
  end

  subject {@seller_transaction}

  describe "responds to" do
    it {should respond_to(:order, :points, :seller_dues)}
  end

  describe "calculates seller dues correctly" do
    it{ @seller_transaction.seller_dues == (@seller_transaction.order.total * 0.08).round(2) }
  end
end

