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
		before :each do
        	@product = FactoryGirl.attributes_for(:product)
      	end

      	it "increases Product count number by one" do
      		expect{ post :create, product: @product }.to change(Product, :count).by(1)
      	end

    	it "redirects to the created product's page" do
        	expect(post :create, product: @product).to redirect_to product_path(assigns(:product))
      	end
    end

    

end
