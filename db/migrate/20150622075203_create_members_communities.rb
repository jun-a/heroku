class CreateMembersCommunities < ActiveRecord::Migration
  def change
    create_table :members_communities do |t|
      t.references :member, null: false
      t.references :community, null: false


      t.timestamps null: false
    end
  end
end
