class Order < ApplicationRecord
  belongs_to :customer
  validates :customer_id, presence: true 
  validates :product_name, presence: true 
  validates :product_count, presence: true
end
