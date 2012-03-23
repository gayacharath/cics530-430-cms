class Project < ActiveRecord::Base
	has_many :resources
	belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"
	has_many :contributions
  	has_many :users, :through => :contributions


	# validates associated is crashing app, commenting out for now - Matthew
	# validates_associated :users, :owner

	attr_accessible :started_at, :ending_at, :name, :description, :owner_id

	validates_presence_of :started_at, :ending_at, :name, :description, :owner_id

	validates_length_of :name, :minimum => 3, :allow_nil => false, :allow_blank => false
	validates_format_of :name, :with => /^[\sa-zA-Z0-9_-]{3,}$/i
	validates_uniqueness_of :name, :case_sensitive => false
	


end
