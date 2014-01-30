$(document).ready(function() {
	ko.applyBindings(AdminViewModel, document.getElementById('adminPage'));
	AdminViewModel.loadLicences();
});

var AdminViewModel = new function() {
	var self = this;

	self.eRepDay = ko.observable(0);
	self.licences = ko.observableArray([]);

	self.currentLicence = null;
	self.payments = ko.observableArray([]);

	self.loadLicences = function(sortFct) {
		self.licences([]);
		ManagementService.listLicences({
			callback : function(response) {
				self.eRepDay(response.eRepDay);
				if (sortFct) {
					response.licences.sort(sortFct);
				}
				self.licences(response.licences);
			},
			errorHandler : onErrorFct
		});
	}

	self.saveLicence = function() {
		var licence = {
			appId : $('#appId').val(),
			validUntilDay : $('#validUntil').val(),
			userLimit : $('#userLimit').val(),
			contactEmail : $('#contactEmail').val()
		};

		ManagementService.addLicence(licence, {
			callback : function(response) {
				self.loadLicences();
			},
			errorHandler : onErrorFct
		});
	}

	self.loadPayments = function(licence) {
		self.currentLicence = licence;
		self.payments([]);
		ManagementService.listPayments(licence, {
			callback : function(response) {
				self.payments(response);
				console.log(response);
				$('#paymentDetails').modal('show');
			}
		});
	}

	self.savePayment = function() {
		var payment = {
			value : $('#paymentValue').val(),
			type : $('#paymentType').val(),
			paymentDate : $('#paymentDate').val(),
			fromDay : $('#paymentFromDay').val(),
			toDay : $('#paymentToDay').val(),
			notes : $('#paymentNotes').val()
		};
		ManagementService.addPayment(self.currentLicence, payment, {
			callback : function(response) {
				self.loadPayments(self.currentLicence);
			}
		});
	}

	self.removePayment = function(payment) {
		ManagementService.removePayment(self.currentLicence, payment, {
			callback : function(response) {
				self.loadPayments(self.currentLicence);
			}
		});
	}

	self.sendEmail = function() {
		ManagementService.sendMessage($('#email-sbj').val(), $('#email-text')
				.val(),
				{
					callback : function(response) {
						$('#email-form').addClass(
								response ? 'has-success' : 'has-error');
						$('#email-form')[0].reset();
					}
				});
	}

	function onErrorFct(message) {
		alert("Oops: " + JSON.stringify(message));
	}
}

function sortByEdition(a, b) {
	return b.editedAt - a.editedAt;
}

function sortByValidity(a, b) {
	return a.validUntilDay - b.validUntilDay;
}

function sortByUserLimit(a, b) {
	return a.userLimit - b.userLimit;
}

function sortByEmail(a, b) {
	return a.contactEmail - b.contactEmail;
}

function sortById(a, b) {
	return a.appId - b.appId;
}

function sortByEditor(a, b) {
	return a.editedBy - b.editedBy;
}
