class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:phone_no,:building_id
  # attr_accessible :title, :body
  validates_presence_of :phone_no, :building_id
  belongs_to :building
  validates :phone_no, :numericality => true, :length => { :minimum => 10, :maximum => 10 }

  has_many :orders

  def name
    email
  end
end
