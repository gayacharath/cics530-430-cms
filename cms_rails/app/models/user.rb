class User < ActiveRecord::Base
	has_many :resources
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"

	has_and_belongs_to_many :projects

	validates_presence_of :email
end
