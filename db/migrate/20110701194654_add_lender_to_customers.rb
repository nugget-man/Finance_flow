class AddLenderToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :lender, :string
  end

  def self.down
    remove_column :customers, :lender, :string
  end
end
