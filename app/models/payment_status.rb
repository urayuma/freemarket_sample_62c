class PaymentStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '支払い済み' },
    { id: 2, name: '未払い' }
  ]
end
