class CreditcardMonth < ActiveHash::Base
  self.data = [
    { value: 1, name: '01' }, { value: 2, name: '02' }, { value: 3, name: '03' },
    { value: 4, name: '04' }, { value: 5, name: '05' }, { value: 6, name: '06' },
    { value: 7, name: '07' }, { value: 8, name: '08' }, { value: 9, name: '09' },
    { value: 10, name: '10' }, { value: 11, name: '11' }, { value: 12, name: '12' }
  ]
end
