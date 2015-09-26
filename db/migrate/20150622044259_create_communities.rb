class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.attachment  :image
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
