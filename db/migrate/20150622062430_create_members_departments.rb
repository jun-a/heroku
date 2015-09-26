class CreateMembersDepartments < ActiveRecord::Migration
  def change
    create_table :members_departments do |t|

      t.references :member, null: false
      t.references :department, null: false


      t.timestamps null: false
    end
  end
end
