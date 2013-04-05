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

require 'spec_helper'

describe OrderLine do
    before { @order_line = FactoryGirl.create(:order).order_lines.first }

    subject {@order_line}

    describe "responds to all fields" do
        it {should respond_to(:order, :product, :qty, :line_total)}
    end

    describe "validates requirements" do
        describe "must be associated to an order" do
            before {@order_line.order  = nil}

            it {should_not be_valid}
        end

        describe "must have a product" do
            before {@order_line.product = nil}
            it {should_not be_valid}
        end

        it "must have a qty > 0" do
            @order_line.qty.should be > 0
        end
    end

    describe "should have valid calculations" do
        describe "line total" do
            let(:test_qty) {2}
            let(:test_product_price) {5}

            before do
                @order_line.qty = test_qty
                @order_line.product.price = test_product_price
            end

            it {@order_line.line_total.should eq(test_qty * test_product_price)}
        end
    end
end
