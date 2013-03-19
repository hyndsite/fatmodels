# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

require 'spec_helper'

describe User do
    before { @user = FactoryGirl.create(:user)  }
    subject {@user}

    describe "responds to all fields" do
        it {should respond_to(:name)}
        it {should respond_to(:email)}
    end

    it "should be valid" do
    should be_valid
  end

  #Name
  describe "when a user has no name" do
    before {@user.name = " "}
    subject {@user}

    it { should_not be_valid }
  end

  describe "when an name is too long" do
    before {@user.name = "a" * 51 }
    it { should_not be_valid}
  end

  #EMAIL
  describe "when a user doesn't have an email" do
    before { @user.email = " "}
    it { should_not be_valid }
  end

  describe "when an email is invalid" do
    it "should be invalid" do
      addresses = %w[with@acomma,com
                                without.atsign.org
                                withno@ending
                                with@an_underscore.com
                                and@has_a+sign.com]

      addresses.each do |a|
        @user.email = a
        @user.should_not be_valid
      end
    end
  end

  describe "when an email is valid" do
    it "should be valid" do
      addresses = %w[one_with-dash@and.underscores.com
                                UPPER.CASE@ALL.COM
                                with+signs@inthebeginning.com]
    end
  end

  describe "when an email already exists" do
    before do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.save
    end

      specify { @user_with_same_email.should_not be_valid }
  end

  describe "value of email when saved" do
    before do
      @user.email = "IM_IN@UPPERCASE.COM"
      @user.save
    end

    it "should save to lowercase" do
      @user.email.should_not eq(@user.email.upcase)
    end
  end

  #Buyer
  describe "As a buyer" do

  end

end
