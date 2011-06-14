class CreateStepones < ActiveRecord::Migration
  def self.up
    create_table :stepones do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.boolean :creditcheck
      t.integer :credexp
      t.integer :credequ
      t.integer :credtra
      t.boolean :lender

      t.timestamps
    end
  end

  def self.down
    drop_table :stepones
  end
end
