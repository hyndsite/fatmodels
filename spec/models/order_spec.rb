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

require 'spec_helper'

describe Order do
    before { @order = FactoryGirl.create(:order) }
    subject { @order }

    describe "responds to" do
        it {should respond_to(:tax, :total, :user, :seller_transaction, :order_lines)}
    end

    describe"is invalid if" do
        describe "does not have a valid associated user" do
            before {@order.user = nil}

            it {should be_invalid}
        end

        describe "does not have a valid associated seller_transaction" do
            before {@order.seller_transaction = nil}

            it {should be_invalid}
        end

        describe "has no order lines"  do
            before {@order.order_lines.clear}

            it {should be_invalid}
        end
    end

    describe "total is calculated" do
        let(:manual_total) {35}
        before do
            @order.order_lines = []
            @order.order_lines.create(product: FactoryGirl.create(:product, price: 10), qty: 3, order: @order)
            @order.order_lines.create(product: FactoryGirl.create(:product, price: 5), qty: 1, order: @order)
        end

        it "should total up all order line totals" do
            @order.total.should eq(manual_total)
        end
    end

    # describe "tax is calculated"  do

    #     before do
    #         @user = FactoryGirl.create(:user, tax_rate: 0.07)
    #         @order = FactoryGirl.create(:order, user: @user)
    #         @order.order_lines.create(product: FactoryGirl.create(:product, price: 10), qty: 3, order: @order)
    #         @order.order_lines.create(product: FactoryGirl.create(:product, price: 5), qty: 1, order: @order)
    #     end

    #     it {tax.should eq(@user.tax_rate * @order.total)}
    # end
end
