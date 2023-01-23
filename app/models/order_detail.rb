class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum payment_method: { impossible: 0, preparation: 1, making: 2, finished: 3 }
end
