class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	belongs_to :shopping_cart
end
