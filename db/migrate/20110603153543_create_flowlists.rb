class CreateFlowlists < ActiveRecord::Migration
  def self.up
    create_table :flowlists do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :flowlists
  end
end
