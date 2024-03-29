CmsRails.Views.ProjectLi = Backbone.View.extend({
	tagName: "li",

	className: "ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-up-d",

	template: JST['projects/list_item'],

	render: function() {
		var model = this.model;
		var content = this.template(model.toJSON());
		this.$el.html(content);
		return this;
	}
});


CmsRails.Views.ProjectView = Backbone.View.extend({

	template: JST['projects/show'],

	render: function() {
		var model = this.model;
		var content = this.template(model.toJSON());
		this.$el.html(content);
		return this;
	},

	events: {
		"vclick #back_btn": function(e) {
			e.preventDefault();
			window.app.navigate("projects", {trigger: true});
		},

		"vclick #uploadPhoto": function(e) {	
			var that = this;
			
			navigator.camera.getPicture(function(imageURI) {
							var options = new FileUploadOptions();
							var desc = "Uploaded from project box mobile app on " + new Date().toDateString() + " at " + new Date().toLocaleTimeString();
				            options.fileKey="file";
				            options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
				            options.mimeType="image/jpeg";
				
				            options.params = {
									name: "Mobile Upload " + options.fileName,
					            	description: desc,
									commit: "Create Resource",
									project_id: that.model.id,
				           		};
				            
				
				            var ft = new FileTransfer();
				            //ft.upload(imageURI, "http://ec2-23-21-28-8.compute-1.amazonaws.com/mobile/projects/" + that.model.id + "/resources/", function(){
				            //ft.upload(imageURI, "http://192.168.43.62:3000/projects/" + that.model.id + "/resources/", function(){
				            ft.upload(imageURI, "http://ec2-23-21-28-8.compute-1.amazonaws.com/projects/" + that.model.id + "/resources/", function(){	
				            	alert("Uploaded successfully");
				            }, function(){
				            	alert("Uploaded failed");
				            }, options);
			}, function() {
				alert("failed to upload photo");
			}, { quality: 50, 
	        destinationType: destinationType.FILE_URI,
	        sourceType: pictureSource.PHOTOLIBRARY });
		},

		"vclick #capturePhoto": function(e) {
			var that = this;
			navigator.camera.getPicture(function() {
//				alert("Photo taken successfully");
			}, function() {
				alert("failed to capture photo");
			}, { 
				quality: 50, 
				destinationType : Camera.DestinationType.DATA_URL 
			});
		},

	}
});

CmsRails.Views.ProjectsView = Backbone.View.extend({

	template: JST['projects/index'],

	initialize: function() {
		this.collection.on("reset", this.renderCollection, this);
	},
	
	events: {
		
	},
	
	renderCollection: function() {
		var projs = this.collection.models;
		this.$("#projs-listview").html("")
		if(projs.length === 0) {
			$.mobile.showPageLoadingMsg();
		}
		else {
			$.mobile.hidePageLoadingMsg();
			for( var i = 0; i < projs.length; i++ ) {
				var v = new CmsRails.Views.ProjectLi({model: projs[i]});
				this.$("#projs-listview").append(v.render().el)
			}
		}
		return this;
	},
	
	render: function() {
		this.$el.html(this.template({}));
		this.renderCollection();
		return this;
	},
});