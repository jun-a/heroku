class AddOmniauthToMembers < ActiveRecord::Migration
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
    add_column :members, :token, :string
  end
end
