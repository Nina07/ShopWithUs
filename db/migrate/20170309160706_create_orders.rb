class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.decimal :bill_amount

      t.timestamps null: false
    end
  end
end
