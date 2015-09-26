class CreateCommunityComments < ActiveRecord::Migration
  def change
    create_table :community_comments do |t|
      t.text :comment
      t.attachment  :image
      t.references :community
      t.references :member

      t.timestamps null: false
    end
  end
end
