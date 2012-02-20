class User < ActiveRecord::Base
	has_many :resources
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"

	has_and_belongs_to_many :projects

  validates_associated :resources, :announcements, :owned_projects, :projects

	validates_presence_of :email, :full_name, :pref_name
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :full_name, :minimum => 3, :allow_nil => false, :allow_blank => false
  validates_format_of :full_name, :with => /^[a-zA-Z]{3,}$/i

end
