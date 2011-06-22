class CreateStepfours < ActiveRecord::Migration
  def self.up
    create_table :stepfours do |t|
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname
      t.string :title
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :stepfours
  end
end
