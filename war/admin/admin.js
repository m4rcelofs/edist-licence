function loadLicences() {
	$('#licences > tbody > tr').remove();
	ManagementService.listLicences({
		callback : function(response) {
			response.licences.forEach(function(entry) {
				
				var clazz = '';
				if(entry.validUntilDay < response.eRepDay) {
					clazz = 'danger';
				} else if (entry.validUntilDay < (response.eRepDay + 14)) {
					clazz = 'warning';
				}
				
				var row = 
					'<tr class="' + clazz +'"><td>' + entry.appId + 
					'</td><td>' + entry.validUntilDay + 
					'</td><td>' + entry.editedAt.toLocaleString() + 
					'</td><td>' + entry.editedBy + 
					'</td></tr>';
				
				$('#licences').append(row);
			});
		},
		errorHandler : errorHandlerFunction
	});
}

function saveLicence() {
	
	if(!$('#add-form').valid()) {
		$('#result').attr('src', '../img/error.png');
		return;
	}
	
	$('#add-form :input').prop("disabled", true);
	
	var licence = {
		appId : $('#appId').val(),
		validUntilDay : parseInt($('#validUntil').val()),
	};

	ManagementService.addLicence(licence, {
		callback : function(response) {
			if (response) {
				$('#result').attr('src', '../img/valid.png');
				loadLicences();
			}
			$('#add-form :input').prop("disabled", false);
		},
		errorHandler : function(message) {
			$('#result').attr('src', '../img/error.png');
			$('#add-form :input').prop("disabled", false);
		}
	});
}

function errorHandlerFunction(message) {
	alert("Oops: " + JSON.stringify(message));
}