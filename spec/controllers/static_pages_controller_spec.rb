require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success and wheather from the seleted city and country" do
      get :home, params: { :city => "Berlin", :country => "DE" }

      expect(response).to have_http_status(:success)
      expect(assigns(:weather_data)['name']).to match /Berlin/
      expect(assigns(:weather_data)['sys']['country']).to match /DE/
      expect(assigns(:main_weather)['temp']).not_to be_nil
    end

    it "returns wheather from the seleted city without country" do
      get :home, params: { :city => "London" }

      expect(response).to have_http_status(:success)
      expect(assigns(:weather_data)['name']).to match /London/
      expect(assigns(:weather_data)['sys']['country']).to match /GB/
      expect(assigns(:main_weather)['temp']).not_to be_nil
    end

    it "returns http success from a random city" do
      get :home, params: { :random => true }

      expect(response).to have_http_status(:success)
      expect(assigns(:weather_data)['name']).not_to be_empty
      expect(assigns(:main_weather)['temp']).not_to be_nil
    end

    it "returns errors when the city is not found" do
      get :home, params: { :city => "hhhhhhhhhhhhhhh" }

      expect(response).to have_http_status(:success)
      expect(assigns(:errors)).not_to be_empty
      expect(assigns(:errors)[:city]).to include "not found"
    end
  end

end
