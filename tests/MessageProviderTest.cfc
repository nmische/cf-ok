component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();	
	}

	public void function setup(){
		messageProvider = new ok.MessageProvider('DefaultMessages');
	}

	public void function testGetMessageReturnsMessage(){
		var msg = messageProvider.getMessage('type');
		assert(!compareNoCase(msg,'{display} is not of type {type}.'));
	}

	public void function testGetMessageReturnsBlankMessage(){
		var msg = messageProvider.getMessage('unknown');
		assert(!compareNoCase(msg,''));
	}
	
}