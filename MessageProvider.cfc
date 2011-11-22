component accessors="true" {

	property string resourceBundle;
	property struct messages;

	function init(resourceBundle='DefaultMessages') {
		setResourceBundle(arguments.resourceBundle);
		setMessages({});
		loadResourceBundle();
		return this;
	} 
	
	private function loadResourceBundle() {
		var file = fileOpen(getResourceBundle());
		var messages = getMessages();		
		while (! fileIsEOF(file)) {
			var x = fileReadLine(file);
			var type = listFirst(x,"=");
			var message = listLast(x,"=");
			messages[type] = message;
		}
	}
	
	public function getMessage(type) {
		var messages = getMessages();
		if (structKeyExists(messages,type)) {
			return messages[type];
		}
		return "";
	}
	
	public function getResourceBundle() {
		var dir = getDirectoryFromPath(getCurrentTemplatePath());
		var rbPath = dir & "resources/" & variables.resourceBundle;
		rbPath = (right(rbPath,11) == '.properties') ? rbPath : rbPath & '.properties';
		return rbPath;
	}

}