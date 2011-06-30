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
  STAGES = ['0. Customer Info', '1. Structure and Submit', '2. Order Appraisal', '3. More Steps Go Here']
  SALESMEN = ['Purvis', 'Hildreth', 'Turner', 'Conklin']
    def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
