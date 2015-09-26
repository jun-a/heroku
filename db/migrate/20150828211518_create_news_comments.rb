class CreateNewsComments < ActiveRecord::Migration
  def change
    create_table :news_comments do |t|
      t.integer :news_id
      t.integer :member_id
      t.integer :news_comment_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
