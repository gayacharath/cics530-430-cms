ActiveAdmin.register Project do
	sidebar "Resources", :only =>:show do
		table_for Resource.where(:project_id => self.project) do |t|
		t.column("Resource") { |resource| link_to resource.name, admin_resource_path(resource) }
  end
		
	end
	
	
	
  
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
