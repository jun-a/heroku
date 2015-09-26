class CreateMainDepartments < ActiveRecord::Migration
  def change
    create_table :main_departments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
