component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();	
	}

	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.NotNullRule(messageProvider);
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooNotNullTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Test');
		var result = rule.isValid(obj,prop);
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooNotNullTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		var result = rule.isValid(obj,prop);
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooNotNullTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		var msg = rule.getMessage(obj,prop,'notnull');
		assertEquals(msg, 'Property is required.');
	}	
	
}