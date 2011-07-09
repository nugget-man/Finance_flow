class Stepthirteen < ActiveRecord::Base
  belongs_to :customer
    def self.search(search)
    if search
      where('customer_lname LIKE ?', "%#{search}%")
    else
      scoped
    end
    end
end
