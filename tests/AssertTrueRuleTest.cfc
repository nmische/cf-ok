component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.AssertTrueRule(messageProvider);
	}
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooAssertTrueTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(true);
		var result = rule.isValid(obj, prop, 'ok_asserttrue');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooAssertTrueTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(false);
		var result = rule.isValid(obj, prop, 'ok_asserttrue');
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooAssertTrueTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(false);
		var msg = rule.getMessage(obj, prop, 'ok_asserttrue');
		assertEquals('Property is not true.', msg);
	}
}