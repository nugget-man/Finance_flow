class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.boolean :accepted
      t.boolean :inprogress
      t.boolean :completed
      t.boolean :closed
      t.integer :user_id
      t.string :submitter

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
