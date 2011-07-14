class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  ROLE = %w[admin management finance sales]
end
