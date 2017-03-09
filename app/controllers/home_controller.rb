class HomeController < ApplicationController
  def index
  	@products = Product.order(:created_at)
  end
end
