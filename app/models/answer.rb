class Answer < ApplicationRecord

  validates :name, presence: true, length: {maximum: 30}
  validates :answer, presence: true, length: {maximum: 200}



  attachment :image

  #　アソシエーション
  belongs_to :customer
  belongs_to :question
  #　アソシエーション

end
