require 'spec_helper'

describe OrderLine do
    before { @order_line = FactoryGirl.create(:order).order_lines.first }
    subject {@order_line}

    describe "responds to all fields" do
        it {should respond_to(:order)}
        it {should respond_to(:product)}
        it {should respond_to(:qty)}
        it {should respond_to(:line_total)}
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

        describe "must have a quantity greater than 0" do
            before {@order_line.qty = 0}

            it {should_not be_valid}
        end
    end
end
