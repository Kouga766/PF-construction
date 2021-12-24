class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      #FK
      # デプロイの際にcustomerの後に入れないとエラーが出たため、customerより後に追記
      # t.references :customer, foreign_key: true
       t.references :item, foreign_key: true
      #FK

      #追加カラム
      t.string  :name,        :null => false
      t.string  :image_id
      t.string  :comment, :null => false
      t.float   :make
      t.float   :appearance
      t.float   :configuration
      t.float   :precision
      t.float   :price

      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
      #追加カラム
    end
  end
end
