class Volunteer < ActiveRecord::Base
  attr_accessible :address, :background, :dob, :email, :firstname, :home, :lastname, :moblie, :title
<<<<<<< HEAD
  has_many :whiteboards
=======
  
  :validates :title, :presence => true
  :validates :dob, :presence => true
  :validates :firstname, :presence => true
  :validates :lastname, :presence => true
  :validates :address, :presence => true
  :validates :email, :presence => true
  
  #We only want one of these 2 to be required
  :validates :mobile, :presence => true
  :validates :home, :presence => true
  
  :validates :background, :presence => true
  
  has_many :notepads
>>>>>>> b4e227079c7941e353b0c45e2bd56a0b3e5baf5b
end
