require 'rails_helper'
require 'tempfile'

RSpec.describe EarningsController, type: :controller do
  let(:current_user) { FactoryBot.create(:employer) }

  # describe "POST #import" do
  #   before do
  #     allow_any_instance_of(EarningsController).to receive(:current_user) { current_user }
  #   end

  #   it "redirects to home page" do
  #     file = file_fixture("earnings.csv")
  #     post import_earnings_path, params: {use_route: 'earnings/', file: file}
  #     expect(response.status).to be(200)
  #   end
  # end

  describe "#index" do
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
