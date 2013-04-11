require 'spec_helper'

describe Seller do
    before {@seller = Seller.new(FactoryGirl.create(:user))}

    subject {@seller}

    it {should respond_to(:name, :market_place)}

    describe "when has seller transactions" do
        before { }
    end
end
