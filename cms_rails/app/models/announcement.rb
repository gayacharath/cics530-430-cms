class Announcement < ActiveRecord::Base
	belongs_to :user

  validates_presence_of :topic, :content, :type

end
