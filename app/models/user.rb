class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin management finance sales]
  has_many :steptwo
  has_many :stepthree
  has_many :stepone
  has_many :stepfour
  has_many :stepfive
  has_many :stepsix
  has_many :stepseven
  has_many :stepeight
  has_many :stepnine
  has_many :stepten
  has_many :comments
  has_and_belongs_to_many :roles
  def is?(role)
    roles.include?(role.to_s)
  end
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
