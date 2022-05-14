require 'rails_helper'
require 'tempfile'

RSpec.describe EarningsController, type: :controller do
  let(:current_user) { FactoryBot.create(:employer) }

  # describe "#import" do
  #   it "redirects to home page" do
  #     post(:import, params:{file: { path: '../../test/earnings.csv',
  #       name: "earnings.csv"}}, current_user.id)
  #     expect(response).to(redirect_to(root_path))
  #   end
  # end

  # describe "#index" do
  #   it "renders index template" do
  #     get :index
  #     expect(response).to render_template(:index)
  #   end
  # end
end
