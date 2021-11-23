class Review < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :comment, presence: true, length: {maximum: 200}

  #　アソシエーション
  belongs_to :customer
  belongs_to :items
  #　アソシエーション



end
