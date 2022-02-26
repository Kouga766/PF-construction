class Genre < ApplicationRecord

  validates :name, presence: true

 # アソシエーション
  has_many :items, dependent: :destroy
 # アソシエーション

end
