class CreateStepnines < ActiveRecord::Migration
  def self.up
    create_table :stepnines do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.boolean :irrelevent
      t.boolean :refurb
      t.boolean :survey
      t.boolean :title
      t.boolean :utilities
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :stepnines
  end
end
