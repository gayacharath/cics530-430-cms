class User < ActiveRecord::Base
	has_many :resources
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"
	has_and_belongs_to_many :projects

  validates_associated :resources, :announcements, :owned_projects, :projects

  #Authentication Code Begin
  attr_accessible :email, :full_name, :pref_name, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  #Authentication Code End
  
	validates_presence_of :email, :full_name, :pref_name
  #validates_inclusion_of :admin, :in => [0, 1]

  validates_uniqueness_of :email, :case_sensitive => false
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => email_regex

  validates_length_of :full_name, :minimum => 3, :allow_nil => false, :allow_blank => false
  validates_format_of :full_name, :with => /^[\sa-zA-Z]{3,}$/i
  
    scope :administrator, where(:admin => 1)


end
