class Product < ActiveRecord::Base
	validates :name, :description, :price, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 10.0 }

	has_many :line_items
	has_many :orders, through: :line_items
end
