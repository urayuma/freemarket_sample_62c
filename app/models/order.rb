class Order < ApplicationRecord
  has_one :user_evaluation
  belongs_to :item
  belongs_to :user
end
