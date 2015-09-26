class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :url
      t.attachment :image
      t.integer :media_id
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps null: false
    end
  end
end
