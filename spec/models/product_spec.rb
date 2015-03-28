require 'rails_helper'

RSpec.describe Product, type: :model do

	describe "when creating new empty product" do
		let(:book) { Product.new }

		it "should validate title error" do
			expect(book).to have(1).error_on(:title)
		end

		it "should validate description error" do
			expect(book).to have(1).error_on(:description)
		end

		it "should validate price error" do
			expect(book).to have(1).error_on(:price)
		end

		it "should validate image URL error" do
			expect(book).to have(1).error_on(:image_url)
		end
	end

	describe "when creating different price options" do
		
		describe "using negative prices" do

			let(:book) { FactoryGirl.build(:product, price: -1) }

			specify { expect(book).not_to be_valid }
		
			it "should raise price validation error" do
				expect(book).to have(1).error_on(:price)
			end

			it "fails validation with negative price expecting a specific message" do
    			expect(book.errors_on(:price)).to include("must be greater than or equal to 0.01")
  			end
  		end
	
  		describe "using zero as price" do

  			let(:book) { FactoryGirl.build(:product, price: 0) }

  			specify { expect(book).not_to be_valid }
		
			it "should raise price validation error" do
				expect(book).to have(1).error_on(:price)
			end

			it "fails validation with negative price expecting a specific message" do
    			expect(book.errors_on(:price)).to include("must be greater than or equal to 0.01")
  			end
  		end

  		describe "using positive value as price" do

  			let(:book) { FactoryGirl.build(:product, price: 15) }

  			specify { expect(book).to be_valid }
		
			it "should raise price validation error" do
				expect(book).to have(0).error_on(:price)
			end
  		end
	end

	describe "when creating products with identical names" do
		let(:book1) { FactoryGirl.create(:product, title: 'hello', id: 1) }
		let(:book2) { FactoryGirl.create(:product, title: 'hello', id: 2) }

		it "raises unique validation error" do
			expect(book2).not_to be_valid
		end

		it "raises unique validation error" do
			expect(book1).not_to be_valid
			# book2.invalid?
			# expect(book2.errors[:title]).to include("has already been taken")
		end

	end
end
