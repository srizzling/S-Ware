class Volunteer < ActiveRecord::Base
  attr_accessible :address, :background, :dob, :email, :firstname, :home, :lastname, :moblie, :title
  
  validates :title, :presence => true#, :message => ""
  validates :dob, :presence => true
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :address, :presence => true
  validates :email, :presence => true
  validates :background, :presence => true
  
  #We want to only require one of these two
  validates :moblie, :numericality => {:only_integer => true},
                     :presence => true, :if => "home.blank?"
  validates :home, :numericality => {:only_integer => true},
                   :presence => true, :if => "moblie.blank?"
  
  validate :over_18
  
  has_many :notepads
  
  def over_18
    if dob + 18.years >= Date.today
      errors.add(:dob, "can't be under 18")
    end
  end
end
