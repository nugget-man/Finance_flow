class CreateTimers < ActiveRecord::Migration
  def self.up
    create_table :timers do |t|
      t.integer :customer_id
      t.integer :delay
      t.timestamps
    end
  end

  def self.down
    drop_table :timers
  end
end
