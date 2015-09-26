class CreateMessageIcons < ActiveRecord::Migration
  def change
    create_table :message_icons do |t|
      t.string :category
      t.string :icon

      t.timestamps null: false
    end
  end
end
