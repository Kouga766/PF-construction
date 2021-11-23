class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #　アソシエーション
  has_many :review, dependent: :destroy
  has_many :question, dependent: :destroy
  has_many :answers, dependent: :destroy
  #　アソシエーション

  # enum
  enum is_deleted:  { 退会: true, 有効: false }
  # enum

end
