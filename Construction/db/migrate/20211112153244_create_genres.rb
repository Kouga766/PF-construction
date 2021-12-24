class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      #追加カラム
      t.string :name,             :null => false
      t.datetime :created_at,     :null => false
      t.datetime :updated_at,     :null => false
      #追加カラム

      t.timestamps
    end
  end
end
