class AddFieldsToStepones < ActiveRecord::Migration
  def self.up
    add_column :stepones, :downpayment, :integer
    add_column :stepones, :loantype, :string
    add_column :stepones, :lender, :string
    remove_column :stepones, :credexp, :string
    remove_column :stepones, :credequ, :string
    remove_column :stepones, :credtra, :string
    remove_column :stepones, :creditcheck, :boolean
    remove_column :stepones, :title, :string
  end

  def self.down
    remove_column :stepones, :downpayment, :integer
    remove_column :stepones, :loantype, :string
    remove_column :stepones, :lender, :string
    add_column :stepones, :credexp, :string
    add_column :stepones, :credequ, :string
    add_column :stepones, :credtra, :string
    add_column :stepones, :creditcheck, :boolean
    add_column :stepones, :title, :string
  end
end
