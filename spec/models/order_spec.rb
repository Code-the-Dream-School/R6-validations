require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { Order.new(product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer) )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer" do
    subject.customer=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if customer record doesn't contain customer_id" do
    subject.customer_id += 1
    expect(subject).to_not be_valid
  end
  it "is not valid if product_count is not positive" do
    subject.product_count = -1
    expect(subject).to_not be_valid
  end
  it "is not valid if product_count is not an integer" do
    subject.product_count = 1.5
    expect(subject).to_not be_valid
  end

end
