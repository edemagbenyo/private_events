class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :event_date


      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
