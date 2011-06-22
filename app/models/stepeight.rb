class Stepeight < ActiveRecord::Base
    belongs_to :customer
  attr_accessible :title, :customer_id
end
