class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :phoneno
      t.boolean :isactivemember

      t.timestamps null: false
    end
  end
end
