class User < ActiveRecord::Base
	validates :firstname, :presence => true    
	validates :email, :presence => true
	has_attached_file :pic, :styles => 
	        { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :attach
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Add :confirmable?

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :phone, :pic
end
