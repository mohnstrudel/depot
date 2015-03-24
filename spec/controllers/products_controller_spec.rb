require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe "testing http responses" do
		it 'when getting index' do
			get :index
			expect(response).to have_http_status(200)
		end

		it 'when getting new' do
			get :new
			expect(response).to have_http_status(200)
		end

	end

	describe "creating new product" do
		it "should increase product count by one" do
			# Let's use factories instead!

			@product = {
				title: 'Lorem Impsum',
				description: 'Wibbles are fun',
				image_url: 'some_url.jpg',
				price: 19.95
			}
			expect{ Product.create(@product) }.to change{ Product.count }.by(1)
		end
	end

end
