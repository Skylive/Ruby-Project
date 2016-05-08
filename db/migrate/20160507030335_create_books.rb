class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn, :default => 0
      t.text :description
      t.string :author
      t.string :image, :default => "default.jpg"
      t.integer :member_id, :default => 0
      t.datetime :end_date
      t.datetime :max_end_date
      t.integer :last_member_id, :default => 0
      t.datetime :last_loan_date
      t.boolean :isactivebook, :default => true
      t.string :reason

      t.timestamps null: false
    end
  end
end
