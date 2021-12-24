class Question < ApplicationRecord

  validates :name, presence: true, length: {maximum: 30}
  validates :question, presence: true, length: {maximum: 200}



  attachment :image

  #　アソシエーション
  belongs_to :customer, optional: true
  has_many :answers, dependent: :destroy
  #　アソシエーション


  # enum
  enum is_Q:  { 技術系: true, その他: false }
  # enum
end
