class StoreController < ApplicationController
  
	def increment_counter
		if session[:counter].nil?
			session[:counter] = 0
		end
		session[:counter] += 1
	end

  def index
  	@count = increment_counter 	
  	@products = Product.order(:title)
  end
end
