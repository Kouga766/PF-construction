class AddReferencesToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :customer, foreign_key: true
    add_reference :questions, :customer, foreign_key: true
    add_reference :answers, :customer, foreign_key: true
  end
end
