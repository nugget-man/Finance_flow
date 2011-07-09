class CreateStepelevens < ActiveRecord::Migration
  def self.up
    create_table :stepelevens do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :updated_by
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :stepelevens
  end
end
