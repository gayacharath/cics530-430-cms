class Resource < ActiveRecord::Base
	belongs_to :project, :foreign_key => :pid, :class_name => "Project"
	belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"
	has_and_belongs_to_many :users
	validates_associated :users, :owner, :project
	
	attr_accessible :resourcetype, :version, :modifydate, :resourcename, :resourcecontent, :owner_id, :pid

	validates_presence_of :resourcetype, :version, :modifydate, :resourcename, :resourcecontent, :owner_id, :pid

	validates_length_of :resourctype, :minimum => 1, :maximum => 5, :allow_nil => false, :allow_blank => false
  validates_format_of :resourcetype, :with => /^[a-zA-Z]{1,}$/i
	validates_uniqueness_of :resourcetype, :case_sensitive => false

	validates_length_of :resourcename, :minimum => 1, :maximum => 100, :allow_nil => false, :allow_blank => true
  validates_format_of :resourcename, :with => /^[a-zA-Z]{1,}$/i
	validates_uniqueness_of :resourcename, :case_sensitive => false

	validates_uniqueness_of :resourcecontent, :case_sensitive => true
end
