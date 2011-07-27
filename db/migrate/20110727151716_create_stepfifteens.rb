class CreateStepfifteens < ActiveRecord::Migration
  def self.up
    create_table :stepfifteens do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.boolean :completed

      t.timestamps
    end
  end

  def self.down
    drop_table :stepfifteens
  end
end
