class Item < ApplicationRecord


  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 200}



  attachment :image

  #　アソシエーション
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  #　アソシエーション


  # enum
  enum is_active:  { リアル系: true, アニメ・ゲーム系: false }
  # enum

end
