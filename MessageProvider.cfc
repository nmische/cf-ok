component accessors="true" {
	
	property string resourceBundle;
	property struct messages;

	function init(resourceBundle) {
		setMessages({});
		loadResourceBundle(getDefaultResourceBundle());
		if (structKeyExists(arguments,"resourceBundle")) {
			setResourceBundle(arguments.resourceBundle);
			loadResourceBundle(arguments.resourceBundle);
		}
		return this;
	} 
	
	private function loadResourceBundle(path) {
		var file = fileOpen(path);
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
	
	private function getDefaultResourceBundle() {
		return getDirectoryFromPath(getCurrentTemplatePath()) & "resources/DefaultMessages.properties";
	}

}