require 'rails_helper'

RSpec.describe UsersController :type => :controller do
  describe "GET new" do
    it "has a 200 status code" do
      get :pinger
      expect(response.status).to eq(200)
    end
  end
end
