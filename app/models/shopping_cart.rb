class ShoppingCart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def increase_product_quantity(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
			current_item.quantity = 1
		end
		current_item
	end

	def self.total_price(line_items)
		total = 0
		line_items.each do |line_item|
			total += line_item.product.price * line_item.quantity
		end
		total
	end
end
