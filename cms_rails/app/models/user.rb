class User < ActiveRecord::Base
	has_many :resources
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"
	has_and_belongs_to_many :projects
  validates_associated :resources, :announcements, :owned_projects, :projects

  attr_accessible :email, :full_name, :pref_name

	validates_presence_of :email, :full_name, :pref_name
  validates_inclusion_of :admin, :in => [true, false]

  validates_uniqueness_of :email, :case_sensitive => false
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => email_regex

  validates_length_of :full_name, :minimum => 3, :allow_nil => false, :allow_blank => false
  validates_format_of :full_name, :with => /^[a-zA-Z]{3,}$/i

end
