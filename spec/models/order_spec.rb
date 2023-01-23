require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new(product_name: "Skittles", product_count:3)}
  
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if product_count is not a number" do
    subject.product_count.is_a? String
    expect(subject).to_not be_valid
  end

  it "returns the correct product_name" do
    expect(subject.product_name).to eq("Skittles")
  end

  it "returns the correct product_count" do
    expect(subject.product_count).to eq(3)
  end
  
end