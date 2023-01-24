class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum item_status: { impossible: 0, preparation: 1, making: 2, finished: 3 }
end
