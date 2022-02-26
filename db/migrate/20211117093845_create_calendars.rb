class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :title
      t.text :content
      t.datetime :start_time

      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
