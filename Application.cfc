component {

	this.name="OKUnitTests";
	
	this.ormEnabled = true;
		
	this.ormsettings = {
		dbcreate = "dropcreate",
		logSQL = true
	};		
	
	this.datasource = "orm";
	
	function onRequestStart() {
		if (structKeyExists(url,'reload')) {			
			ormReload();
			applicationStop();
			location(url="#cgi.script_name#");
		}
	}
	
}