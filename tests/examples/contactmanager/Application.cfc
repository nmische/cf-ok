component extends="lib.org.corfield.framework" {	

	/*
	variables.framework = {
		// the name of the URL variable:
		action = 'action',
		// whether or not to use subsystems:
		usingSubsystems = false,
		// default subsystem name (if usingSubsystems == true):
		defaultSubsystem = 'home',
		// default section name:
		defaultSection = 'main',
		// default item name:
		defaultItem = 'default',
		// if using subsystems, the delimiter between the subsystem and the action:
		subsystemDelimiter = ':',
		// if using subsystems, the name of the subsystem containing the global layouts:
		siteWideLayoutSubsystem = 'common',
		// the default when no action is specified:
		home = 'main' & '.' & 'default',
		// the default error action when an exception is thrown:
		error = 'main' & '.error',
		// the URL variable to reload the controller/service cache:
		reload = 'reload',
		// the value of the reload variable that authorizes the reload:
		password = 'true',
		// debugging flag to force reload of cache on each request:
		reloadApplicationOnEveryRequest = false,
		// whether to force generation of SES URLs:
		generateSES = false,
		// whether to omit /index.cfm in SES URLs:
		SESOmitIndex = false,
		// location used to find layouts / views:
		base = getDirectoryFromPath( CGI.SCRIPT_NAME ),
		// either CGI.SCRIPT_NAME or a specified base URL path:
		baseURL = 'useCgiScriptName',
		// location used to find controllers / services:
		// cfcbase = essentially base with / replaced by .
		// whether FW/1 implicit service call should be suppressed:
		suppressImplicitService = true,
		// list of file extensions that FW/1 should not handle:
		unhandledExtensions = 'cfc',
		// list of (partial) paths that FW/1 should not handle:
		unhandledPaths = '/flex2gateway',
		// flash scope magic key and how many concurrent requests are supported:
		preserveKeyURLKey = 'fw1pk',
		maxNumContextsPreserved = 10,
		// set this to true to cache the results of fileExists for performance:
		cacheFileExists = false,
		// change this if you need multiple FW/1 applications in a single CFML application:
		applicationKey = 'org.corfield.framework'
	};
	*/
	
	this.name = "OKContactManager";
	this.sessionManagement = "true";
	
	this.ormEnabled = true;	
	this.ormsettings = {
		dbcreate = "dropcreate"
	};	
	this.datasource = "OKContactManager";
	
	this.mappings["/ok"] = expandPath("../../");
	this.mappings["/coldspring"] = expandPath("lib/coldspring");	
	
	function setupApplication() {
	
		bf = createObject("component","coldspring.beans.xml.XmlBeanFactory").init(expandPath("config/coldspring.xml"));
		setBeanFactory(bf);
			
	}
		
	function setupRequest() {
		
	}		
	
	
}