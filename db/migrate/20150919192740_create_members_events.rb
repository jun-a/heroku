class CreateMembersEvents < ActiveRecord::Migration
  def change
    create_table :members_events do |t|
      t.references :member, null: false
      t.references :event, null: false      

      t.timestamps null: false
    end
  end
end
