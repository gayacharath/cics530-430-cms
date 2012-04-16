CmsRails.Collections.Projects = Backbone.Collection.extend({
	url:"/projects.json?search=",
	model: CmsRails.Models.Project,
	toJSON: function() {
		var json = Backbone.Collection.prototype.toJSON.call(this);

		json.users || json.users = []
		json.resources || json.resources = []

		return json;
	}
});