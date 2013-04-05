# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  price           :decimal(8, 2)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  market_place_id :integer
#

require 'spec_helper'

describe Product do
  before { @test_product = FactoryGirl.create(:product)}
  subject {@test_product}

  describe "responds to all fields" do
    it {should respond_to(:name)}
    it {should respond_to(:price)}
  end

  it "should be valid" do
    should be_valid
  end

  #Name
  describe "when a product has no name" do
    before {@test_product.name = " "}

    it { should_not be_valid }
  end

  describe "when an name is too long" do
    before {@test_product.name = "a" * 31 }
    it { should_not be_valid}
  end

  describe "does not allow duplicates" do
    before do
      @test_product.save
      @product_with_same_name = @test_product.dup
      @product_with_same_name.save
    end

    it {@product_with_same_name.should_not be_valid}
  end

  #invalid group
  #valid characters $[a-Z, 1-9, -_+.]^
  describe "with invalid name" do
    it "should be invalid" do
      names = %w[! @ # $ % ^ & * ( ) = < > ? / \[ \] \\ | + . ].map {|x| "with#{x}"}

      names.each do |name|
        @test_product.name = name
        @test_product.should_not be_valid
      end
    end
  end

  describe "with valid name" do
    before {@test_product.save}

    it {should be_valid}
  end

  it "product price cannot be nil"
end
