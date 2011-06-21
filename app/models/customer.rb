class Customer < ActiveRecord::Base
  acts_as_commentable
  has_many :comments
  has_one :stepone
  attr_accessible :id, :fname, :lname
    def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
