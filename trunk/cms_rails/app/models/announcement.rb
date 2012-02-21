class Announcement < ActiveRecord::Base
	belongs_to :user

  validates_presence_of :topic, :content, :type
  
  validates_length_of :topic, :minimum => 3, :maximum => 50, :allow_nil => false, :allow_blank => false
  validates_length_of :content, :minimum => 5, :maximum => 100, :allow_nil => false, :allow_blank => false
  validates_length_of :type, :allow_nil => false, :allow_blank => false
  validates_format_of :topic, :with => /^[a-zA-Z]{5,}$/i # need to analyze the validation
  # validate the allowed types like Warning, Info etc 
end
