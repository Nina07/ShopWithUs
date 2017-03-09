class Order < ActiveRecord::Base
	validates :name, :email, presence: true

	has_many :line_items, dependent: :destroy

	def add_line_items(cart)
		cart.line_items.each do |item|
			item.shopping_cart_id = nil
			line_items << item
		end
	end
end
