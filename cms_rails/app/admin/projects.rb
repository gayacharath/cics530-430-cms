ActiveAdmin.register Project do
  
  index do
    column "Project Name", :name
    column "Start Date", :started_at
    column "End Date", :ending_at
    column "Owner", :owner
	column "Description", :description
	column "Created date", :created_at
	column "Last modified", :updated_at
    default_actions
  end
end
