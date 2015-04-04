require 'rails_helper'

RSpec.describe "store/index.html.haml", type: :view do
  		
  		it "should include certain css elements" do
  			# assign(:product, Product.new(title: 'hello world', description: 'wibbles!', image_url: 'hello.jpg', price: 14.99))
  			FactoryGirl.create(:product)
  			render
  			expect(rendered).to have_selector('#column')
  		end
end
