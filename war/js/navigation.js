$(document).ready(function() {
	var currentLoc = window.location.pathname.split('/')[1];
	$('#' + currentLoc).addClass('active');

});

var Navigation = new function() {
	var nav = this;

	nav.setLanguage = function(lang) {
		$.cookie('language', lang, {
			expires : 14,
			path : '/'
		});
		location.reload(true);
	}
};