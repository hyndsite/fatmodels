class Product < ActiveRecord::Base
  attr_accessible :name, :precision, :price, :scale
end
