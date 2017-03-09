class CombineLineItemsInsideCart < ActiveRecord::Migration
  def change
  	ShoppingCart.all.each do |cart|
  		count_of_item = cart.line_items.group(:product_id).sum(:quantity)
  		count_of_item.each do |product_id, quantity|
  			if quantity > 1
  				cart.line_items.where(product_id: product_id).delete_all
  				item = cart.line_items.build(product_id: product_id)
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end
end
