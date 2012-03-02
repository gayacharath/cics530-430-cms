class Project < ActiveRecord::Base
	belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"
	has_and_belongs_to_many :users
	validates_associated :users, :owner

	attr_accessible :started_at, :ending_at, :name, :description, :owner_id

	validates_presence_of :started_at, :ending_at, :name, :description, :owner_id

	validates_length_of :name, :minimum => 3, :allow_nil => false, :allow_blank => false
  	# validates_format_of :name, :with => /^[a-zA-Z]{3,}$/i
	validates_uniqueness_of :name, :case_sensitive => false
	


end
