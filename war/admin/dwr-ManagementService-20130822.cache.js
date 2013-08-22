
// Provide a default path to dwr.engine
if (dwr == null) var dwr = {};
if (dwr.engine == null) dwr.engine = {};
if (DWREngine == null) var DWREngine = dwr.engine;

if (ManagementService == null) var ManagementService = {};
ManagementService._path = '/admin/dwr';
ManagementService.addLicence = function(p0, callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'addLicence', p0, callback);
}
ManagementService.listLicences = function(callback) {
  dwr.engine._execute(ManagementService._path, 'ManagementService', 'listLicences', callback);
}