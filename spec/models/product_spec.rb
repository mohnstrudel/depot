require 'rails_helper'

RSpec.describe Product, type: :model do
  
	let(:book) { Product.new(	title: 'Lorem Ipsum',
								description: 'Wibbles are fun!',
								image_url: 'lorem.jpg',
								price: 19.95)}



end
