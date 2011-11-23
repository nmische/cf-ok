component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.AssertFalseRule(messageProvider);
	}
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooAssertFalseTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(false);
		var result = rule.isValid(obj, prop, 'ok_assertfalse');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooAssertFalseTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(true);
		var result = rule.isValid(obj, prop, 'ok_assertfalse');
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooAssertFalseTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty(true);
		var msg = rule.getMessage(obj, prop, 'ok_assertfalse');
		assertEquals('Property is not false.', msg);
	}
	
}