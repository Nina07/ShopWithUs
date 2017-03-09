class AddNewLineItemToTheCart < ActiveRecord::Migration
  def change
  	LineItem.where("quantity > 1").each do |item|
  		item.quantity.times do
  			LineItem.create(shopping_cart_id: item.shopping_cart_id, product_id: item.product_id)
  		end
  		item.destroy
  	end
  end
end
