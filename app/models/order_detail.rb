class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

validates :quantity, presence:true, numericality: true
validates :order_id, presence:true
validates :product_id, presence:true


end
