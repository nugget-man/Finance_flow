class AddDetailsToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :details, :string

  end

  def self.down
    remove_column :customers, :details, :string
  end
end
