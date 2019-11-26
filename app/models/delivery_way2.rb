class DeliveryWay2 < ActiveHash::Base
  self.data = [
    { id: 1, name: '未定' },
    { id: 7, name: 'クロネコヤマト' },
    { id: 8, name: 'ゆうパック' },
    { id: 3, name: 'ゆうメール' }
  ]
end
