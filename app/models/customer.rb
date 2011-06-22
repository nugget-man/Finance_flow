class Customer < ActiveRecord::Base
  acts_as_commentable
  has_many :comments
  has_one :stepone
  has_one :steptwo
  has_one :stepthree
  has_one :stepfour
  has_one :stepfive
  has_one :stepsix
  has_one :stepseven
  has_one :stepeight
  has_one :stepnine
  has_one :stepten
  attr_accessible :id, :fname, :lname
    def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
