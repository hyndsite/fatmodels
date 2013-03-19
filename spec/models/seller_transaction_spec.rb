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
  pending "add some examples to (or delete) #{__FILE__}"
end
