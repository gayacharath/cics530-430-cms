ActiveAdmin.register User do
	scope :administrator
 
  index do
	column  "Full name", :full_name
    column  "Nick name", :pref_name
    column  "Email", :email
    column  "Is admin?", :admin?
    column  "Create date", :created_at
    column  "Last modified", :updated_at
	default_actions
  end

  #if they are an admin
  # link_to "make admin", create_admin_path(user)
  #if they are not an admin
  # link_to "remove admin", remove_admin_path(user)
  
end
