class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waitting: 0, payment_confirmed: 1, making: 2, preparation: 3, sent: 4 }
  
end
