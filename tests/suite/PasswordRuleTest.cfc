component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.PasswordRule(messageProvider);
	}
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooPasswordTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('pAssw0rd');
		var result = rule.isValid(obj, prop, 'ok_password');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooPasswordTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('test');
		var result = rule.isValid(obj, prop, 'ok_password');
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooPasswordTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('test');
		var msg = rule.getMessage(obj, prop, 'ok_password');
		assertEquals('Property is not a valid password.', msg);
	}
	
}