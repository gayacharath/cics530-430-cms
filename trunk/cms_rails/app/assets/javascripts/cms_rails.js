window.CmsRails = {
  	Models: {},
  	Collections: {},
  	Views: {},
  	Routers: {},
  	init: function() { 
  		//window._login = new LoginModel();
		//window._projects = new Projects();
		//window._projectsView = new ProjectsView({collection: window._projects});
		//window._loginView = new LoginView({model: window._login});
		window.app = new CmsRails.Routers.AppRouter();
		Backbone.history.start({pushState: false, root: "/mobile/"})
  	}
 };
		
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
});
  