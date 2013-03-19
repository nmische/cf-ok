component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}

	public void function setup() {
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.LengthRule(messageProvider);
		ormClearSession();
	}
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooLengthTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Test');
		var result = rule.isValid(obj,prop,'length');
		assertTrue(result);
	}
	
	public void function testNullPasses(){
		var obj = new ok.tests.entities.FooLengthTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		var result = rule.isValid(obj,prop,'length');
		assertTrue(result);
	}
	
	public void function testBlankPasses(){
		var obj = new ok.tests.entities.FooLengthTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('');
		var result = rule.isValid(obj,prop,'length');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooLengthTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Testing');
		var result = rule.isValid(obj,prop,'length');
		debug(result);
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooLengthTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		var msg = rule.getMessage(obj,prop,'length');
		assertEquals('Property must be less than 5 characters.', msg);
	}

}