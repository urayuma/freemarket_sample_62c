class Selling < ActiveHash::Base
  self.data = [
    { id: 1, name: '出品中' },
    { id: 2, name: '交渉中' },
    { id: 3, name: '売り切れ' },
    { id: 4, name: '出品停止' }
  ]
end
