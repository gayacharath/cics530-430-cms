window.CmsRails = {
  	Models: {},
  	Collections: {},
  	Views: {},
  	Routers: {},
  	init: function() { 
  	}
 }

		//Login View code Begin
		var LoginModel = Backbone.Model.extend({
			url:"/sessions.json"			
		});
		
		var LoginView = Backbone.View.extend({
			el: "#login-form",
			
			initialize: function() {
				this.model.on("change:id", this.render, this);
				this.model.on("change:id", this.logged_in, this);
				this.model.on("change:error", this.failed_log_in, this);
			},
			
			events: {
				"click #login": "loginPressed"
			},
			
			render: function() {
				this.$el.toggle(this.model.get("id") === undefined);
			},
			
			loginPressed: function(e) {
				e.preventDefault();
				console.log("attempting to log in");
				var password = this.$("#password").val();
				var email = this.$("#email").val();
				this.model.set({
					email: email,
					password: password
				});
				this.model.save();
			},
			
			logged_in: function() {
				//alert("log in successfully as " + this.model.get("email"));
			
				window._projects.fetch();
			},
			
			failed_log_in: function() {
				alert("invalid user name or password");
			}
		});
		//Login View code End	
			
			//Project View code Begin
			var Project = Backbone.Model.extend({
							
			});

			var Projects = Backbone.Collection.extend({
				url:"/projects.json?search=",
				model: Project		
			});
			
			var ProjectView = Backbone.View.extend({
				tagName: "li",
				attributes: {},
				render: function() {
					//this.$el.html(this.model.get("name"));
					a = $("<a />");
					a.text(this.model.get("name"));
					a.attr ('href', "#");
					this.$el.html(a);
					return this;
				}
			});
		
			var ProjectsView = Backbone.View.extend({
			el: "#projectsDiv",
			//tagName: 'ul',
        	//id: 'projects-list',
        	//attributes: {"data-role": 'listview'},
        
			initialize: function() {
				this.collection.on("reset", this.render, this);
			},
			
			events: {
				
			},
			
			render: function() {
				var projs = this.collection.models;
				for( var i = 0; i < projs.length; i++ ) {
					var v = new ProjectView({model: projs[i]});
					this.$el.append(v.render().el);
				}
				
				return this;
			}
		});
		//Project View code End
		
		//Camera code Begin
		var pictureSource;   
	    var destinationType;  
		document.addEventListener("deviceready",onDeviceReady,false);
	
	    function onDeviceReady() {
	        pictureSource=navigator.camera.PictureSourceType;
	        destinationType=navigator.camera.DestinationType;
	    }
	    function onPhotoURISuccess(imageURI) {
	      var largeImage = document.getElementById('largeImage');
	      largeImage.style.display = 'block';
	      largeImage.src = imageURI;
	    }
	
	    function capturePhoto() {
	      navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 50, destinationType : Camera.DestinationType.DATA_URL });
	    }
	
	    function getPhoto(source) {
	      navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 50, 
	        destinationType: destinationType.FILE_URI,
	        sourceType: source });
	    }
	
	    function onFail(message) {
	      alert('Failed because: ' + message);
	    }
		//Camera code End
		
$(function() {
	CmsRails.init();
	window._login = new LoginModel();
	window._projects = new Projects();
	window._projectsView = new ProjectsView({collection: window._projects});
	window._loginView = new LoginView({model: window._login});
});
  