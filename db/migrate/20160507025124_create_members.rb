class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :login
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :phoneno
      t.boolean :isactivemember, :default => true
      t.boolean :isadmin, :default => false

      t.timestamps null: false
    end
  end
end
