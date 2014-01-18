
// Provide a default path to dwr.engine
if (dwr == null) var dwr = {};
if (dwr.engine == null) dwr.engine = {};
if (DWREngine == null) var DWREngine = dwr.engine;

if (ManagementService == null) var ManagementService = {};
ManagementService._path = '/admin/dwr';
ManagementService.listLicences = function(callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'listLicences', callback);
}
ManagementService.addLicence = function(p0, callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'addLicence', p0, callback);
}
ManagementService.addPayment = function(p0, p1, callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'addPayment', p0, p1, callback);
}
ManagementService.listPayments = function(p0, callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'listPayments', p0, callback);
}