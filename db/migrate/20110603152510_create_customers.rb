class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :homephone
      t.string :cellphone
      t.string :fnameco
      t.string :lnameco
      t.string :emailco
      t.string :homephoneco
      t.string :cellphoneco
      t.string :salesman
      t.string :step
      t.boolean :inprogress
      t.boolean :prelimcondmet
      t.string  :prelimcondmetuser
      t.integer :exp
      t.integer :equ
      t.integer :tra
      t.string :createdby
      t.string :details
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
