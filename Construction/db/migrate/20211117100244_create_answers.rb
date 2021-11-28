class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|

      #FK
      # デプロイの際にcustomerの後に入れないとエラーが出たため、customerより後に追記
      # t.references :customer, foreign_key: true
       t.references :question, foreign_key: true
      #FK

      #追加カラム
      t.string  :name,        :null => false
      t.string  :image_id
      t.string  :answer,      :null => false

      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
      #追加カラム
    end
  end
end
