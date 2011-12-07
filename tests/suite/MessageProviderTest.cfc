component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();	
	}

	public void function setup(){
		
	}

	public void function testGetMessageReturnsMessage(){
		var messageProvider = new ok.MessageProvider();
		var msg = messageProvider.getMessage('type');
		assert(!compareNoCase(msg,'{display} is not of type {type}.'));
	}

	public void function testGetMessageReturnsBlankMessage(){
		var messageProvider = new ok.MessageProvider();
		var msg = messageProvider.getMessage('unknown');
		assert(!compareNoCase(msg,''));
	}
	
	public void function testGetCustomMessageReturnsMessage(){
		var messageProvider = new ok.MessageProvider(resourceBundle=expandPath('resources/CustomMessages.properties'));
		var msg = messageProvider.getMessage('length');
		assert(!compareNoCase(msg,'{display} is to long!'));
	}

}