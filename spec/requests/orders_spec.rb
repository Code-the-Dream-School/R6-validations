require 'rails_helper'

RSpec.describe "Orders", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response).to render_template(:index)
    end
  end
  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response).to render_template(:show)
    end
    it "redirects the index path if the order id is invalid" do
      get order_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to orders_path
    end
  end
  describe "get new_order_path" do
    it "renders the :new template" do 
      get order_path(:new)
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_order_path" do
    it "renders the :edit template" do 
      order = FactoryBot.create(:order)
      get edit_order_path(id: order.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post_orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      customer = FactoryBot.create(:customer)
      order_attributes = FactoryBot.attributes_for(:order, customer_id: customer.id)
      expect {post orders_path, params: {order: order_attributes}}
      .to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order)
      expect {post orders_path, params: {order: order_attributes}}
      .to_not change(Order, :count)
      expect(response).to render_template(:new)
    end  
  end
  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the order" do 
      order = FactoryBot.create(:order)
      put order_path(order.id), params: {order: {product_count: 100}}
      order.reload
      expect(order.product_count).to eq(100)
      expect(response).to redirect_to order_path(id: order.id)
    end   
  end
  describe "put order_path with invalid data" do
    it "does not update the order record or redirect" do
      order = FactoryBot.create(:order)
      put order_path(order.id), params: {order: {product_count: -1}}
      order.reload
      expect(order.product_count).not_to eq(-1)
      expect(response).to render_template(:edit) 
    end
  end
  describe "delete a order record" do
    it "deletes a order record" do
      order = FactoryBot.create(:order)
      delete order_path(id: order.id)
      expect(Order.all).to_not exist
      expect(response).to redirect_to orders_path
    end
  end  
end

## Initial file
# require 'rails_helper'

# RSpec.describe "Customers", type: :request do
#   describe "GET /customers" do
#     it "works! (now write some real specs)" do
#       get customers_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end