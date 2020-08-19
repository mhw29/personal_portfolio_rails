require 'rails_helper'

RSpec.describe "Interests", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/interests/home"
      expect(response).to have_http_status(:success)
    end
  end

end
