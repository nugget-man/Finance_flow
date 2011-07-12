class AddFieldsToStepones < ActiveRecord::Migration
  def self.up
    add_column :stepones, :downpayment, :integer
    add_column :stepones, :loantype, :string
    add_column :stepones, :lender, :string
    remove_column :stepones, :credexp
    remove_column :stepones, :credequ
    remove_column :stepones, :credtra
    remove_column :stepones, :creditcheck
    remove_column :stepones, :title
  end

  def self.down
    remove_column :stepones, :downpayment
    remove_column :stepones, :loantype
    remove_column :stepones, :lender
    add_column :stepones, :credexp, :string
    add_column :stepones, :credequ, :string
    add_column :stepones, :credtra, :string
    add_column :stepones, :creditcheck, :boolean
    add_column :stepones, :title, :string
  end
end
