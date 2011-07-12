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
  STAGES = ['0. Customer Info', '1. Structure and Submit', '2. Approved', '3. GFE Received', '4. GFE Sent w/ Conditions', '5. Title Ordered', '6. Bids Ordered/Received', '7. Title Received', '8. UW Started/Completed', '9. Survey Ordered', '10. Specs & Bids Signed', '11. Appraisal Ordered', '12. Final Conditions', '13. Final Underwriting', '14. Schedule Close']
  SALESMEN = ['Purvis', 'Hildreth', 'Turner', 'Conklin']
    def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
