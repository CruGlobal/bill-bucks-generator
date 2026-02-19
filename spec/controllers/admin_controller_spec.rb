require "rails_helper"

RSpec.describe AdminController, type: :controller do
  render_views

  describe "#index" do
    context "when not logged in" do
      it "redirects to login" do
        get :index

        expect(response).to redirect_to(login_path(return_to_url: admin_url))
      end
    end

    context "when logged in" do
      let(:id_token) do
        payload = {name: "Test User", preferred_username: "test@cru.org"}
        "header.#{Base64.urlsafe_encode64(payload.to_json)}.signature"
      end

      before { session[:okta_id_token] = id_token }

      it "loads successfully" do
        get :index

        expect(response).to have_http_status(:ok)
      end

      it "displays balances" do
        Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")
        Buck.create!(to: "Alice", from: "Carol", buck_type: "vonette")

        get :index

        expect(response.body).to include("Alice")
        expect(response.body).to include("6")
      end

      it "groups recipients case-insensitively" do
        Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")
        Buck.create!(to: "alice", from: "Carol", buck_type: "bill")

        get :index

        expect(response.body).to include("2")
      end
    end
  end
end
