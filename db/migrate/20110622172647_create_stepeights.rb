class CreateStepeights < ActiveRecord::Migration
  def self.up
    create_table :stepeights do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.string :appraisal
      t.integer :phone
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :stepeights
  end
end
