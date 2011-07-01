class Stepone < ActiveRecord::Base
  belongs_to :customer
  LENDERS = ["21st", "CU", "US Bank", "Triad", "Amcap", "Country Place", "RLT Lending", "Global", "1st Guaranty", "Westar"]
  LATE = 172800
  TITLE = "Structure and Submit"
  LOANTYPE = ["Chattel", "Land Plus", "Land in Lieu", "Conventional", "FHA"]
  def self.search(search)
    if search
      where('customer_lname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
