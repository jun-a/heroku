class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :end_date
      t.references :member
      t.references :department

      t.timestamps null: false
    end
  end
end
