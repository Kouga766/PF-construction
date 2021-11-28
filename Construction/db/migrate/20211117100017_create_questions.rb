class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|

      #FK
      # デプロイの際にcustomerの後に入れないとエラーが出たため、customerより後に追記
      # t.references :customer, foreign_key: true
      #FK

      #追加カラム
      t.string  :name,        :null => false
      t.string  :image_id
      t.string  :question,    :null => false
      t.boolean :is_Q,        default: true, null: false

      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
      #追加カラム
    end
  end
end
