# == Schema Information
#
# Table name: market_places
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

require 'spec_helper'

describe MarketPlace do
    before do
        @market_place = FactoryGirl.create(:market_place, :with_products, number_of_products: 5)
    end

    subject {@market_place}

    describe "should respond to all fields" do
        it {should respond_to(:user)}
        it {should respond_to(:products)}
        it {should respond_to(:name)}
    end

    it {should be_valid}

    describe "without name is invalid" do
        before {@market_place.name = ""}

        it {should_not be_valid}
    end

    describe "when an name is too long" do
    before {@market_place.name = "a" * 21 }
    it { should_not be_valid}
  end

  describe "does not allow duplicates" do
    before do
      @market_with_same_name = @market_place.dup
      @market_with_same_name.save
    end

    it {@market_with_same_name.should_not be_valid}
  end

  #invalid group
  #valid characters $[a-Z, 1-9, -_+.]^
  describe "with invalid name" do
    it "should be invalid" do
      names = %w[! @ # $ % ^ & * ( ) = < > ? / \[ \] \\ | + . ].map {|x| "with#{x}"}

      names.each do |name|
        @market_place.name = name
        @market_place.should_not be_valid
      end
    end
  end
end
