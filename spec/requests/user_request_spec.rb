require 'rails_helper'

RSpec.describe "Users", type: :request do
    context "list users" do
        it "request status is 200" do
            get "/users"
            expect(response.status).to eq(200)
        end
    end

end
