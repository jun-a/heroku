class CreateMemberMessages < ActiveRecord::Migration
  def change
    create_table :member_messages do |t|
      t.string :message
      t.integer :from_member_id, null: false
      t.integer :to_member_id, null: false
      t.references :message_icon

      #indexをつけることで重複を防ぐことになっている？
      t.index :from_member_id
      t.index :to_member_id
      t.index [:from_member_id, :to_member_id]

      t.timestamps null: false
    end
  end
end
