require 'rails_helper'

RSpec.describe StoreController, type: :controller do
  render_views
  

  describe "GET #index" do


    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "verifies css elements" do
    	get :index
    	expect(response).to have_selector('#columns', minimum: 4)
    end
  end

end
