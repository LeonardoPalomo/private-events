class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.date :event_date

      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
