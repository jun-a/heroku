class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :article_id
      t.string :type
      t.text :body
      t.integer :sortkey
      t.attachment :image


      t.timestamps null: false
    end
  end
end
