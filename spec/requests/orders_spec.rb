require 'rails_helper'

RSpec.describe "Orders", type: :request do
  
    describe "get orders_path" do
      it "renders the index view" do
        FactoryBot.create_list(:customer, 10)
        get orders_path
        expect(response).to render_template(:index)
      end
  end
end
