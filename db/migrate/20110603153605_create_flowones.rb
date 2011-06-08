class CreateFlowones < ActiveRecord::Migration
  def self.up
    create_table :flowones do |t|
      t.integer :flowlist_id
      t.string :flowlist_name
      t.integer :customer_id
      t.string :customer_fname
      t.string :customer_lname

      t.timestamps
    end
  end

  def self.down
    drop_table :flowones
  end
end
