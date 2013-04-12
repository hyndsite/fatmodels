require 'spec_helper'

describe Buyer do
    before {@buyer = Buyer.new(FactoryGirl.create(:user)) }

    subject {@buyer}

    describe "responds to" do
        it {should respond_to(:name, :email)}
    end

    describe "who has orders" do
        before do
            @order = FactoryGirl.create(:order)
            @buyer = Buyer.new(@order.user)
        end

        it "testing" do
            puts @order.user
        end
       specify {@buyer.has_orders.should eql(true)}
    end
end
