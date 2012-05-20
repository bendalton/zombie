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
  attr_accessor :ip_address
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode, :if => :address_changed?
  def ip_address
    return request_ip
  end

  reverse_geocoded_by :latitude, :longitude,
  	:address => :location
  after_validation :reverse_geocode

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :phone, :pic, :address, :latitude, :longitude, :lat, :lng, :ip_address
end
