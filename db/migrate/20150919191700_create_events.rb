class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_day
      t.integer :community_id
      t.attachment  :image
      t.integer :member_id


      t.timestamps null: false
    end
  end
end
