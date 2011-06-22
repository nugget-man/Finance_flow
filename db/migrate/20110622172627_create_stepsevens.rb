class CreateStepsevens < ActiveRecord::Migration
  def self.up
    create_table :stepsevens do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.string :survey
      t.integer :phone
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :stepsevens
  end
end
