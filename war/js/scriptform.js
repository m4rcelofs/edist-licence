//
//	jQuery Validate example script
//
//	Prepared by David Cochran
//
//	Free for your use -- No warranties, no guarantees!
//

$(document).ready(function(){

	// Validate
	// http://bassistance.de/jquery-plugins/jquery-plugin-validation/
	// http://docs.jquery.com/Plugins/Validation/
	// http://docs.jquery.com/Plugins/Validation/validate#toptions
	$('.selectpicker').selectpicker();
		
	$('#contact-form').validate({
	    rules: {
	      id: {
	        minlength: 2,
	        required: true
	      },
	      email: {
	        required: true,
	        email: true
	      },
	      subject: {
	      	minlength: 2,
	        required: true
	      },
	      message: {
	        minlength: 2,
	        required: true
	      }
	    },
	    errorPlacement: function(error, element) {},
	    highlight: function(element) {
	    	$(element).removeClass('valid').addClass('error');
	    	$(element).closest('.input-group').removeClass('has-success').addClass('has-error');
		},
		unhighlight: function(element) {
			$(element).removeClass('error').addClass('valid');
			$(element).closest('.input-group').removeClass('has-error').addClass('has-success');
			}
	  });

}); // end document.ready