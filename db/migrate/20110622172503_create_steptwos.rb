class CreateSteptwos < ActiveRecord::Migration
  def self.up
    create_table :steptwos do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :steptwos
  end
end
