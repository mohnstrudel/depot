FactoryGirl.define do
	factory :product do
		sequence(:title) { |n| "Some book #{n}" } 
		description "Some crazy wibbles, that are fun"
		image_url "freddie_mercury.jpg"
		price 56.99
	end	
end