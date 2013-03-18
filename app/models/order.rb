class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :scale, :scale, :tax, :total
end
