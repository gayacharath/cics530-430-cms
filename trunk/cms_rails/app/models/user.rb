class User < ActiveRecord::Base
	has_many :resources
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"

	has_and_belongs_to_many :projects

	validates_presence_of :email
  validates_format_of :email
  validates_length_of :email, :allow_blank => false, :allow_nil =>false, :maximum => 256
  validates_uniqueness_of :email

  validates_presence_of :full_name
  validates_format_of :full_name
  validates_length_of :full_name, :allow_blank => false, :allow_nil => false, :minimum => 3, :maximum => 256

  validates_presence_of :pref_name
  validates_format_of :pref_name
  validates_length_of :pref_name, :allow_blank => true, :allow_nil => true, :maximum => 256


# User validations should not allow admin flag to be changed by mass assignment
# User validations must have password that is at least 6 characters
# User validations must confirm its password exactly
# User authentication system should return a user if password is correct
# User authentication system should return nil if password is incorrect



end
