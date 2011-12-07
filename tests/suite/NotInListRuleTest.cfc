component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.NotInListRule(messageProvider);
	}
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooNotInListTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('four');
		var result = rule.isValid(obj, prop, 'ok_notinlist');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooNotInListTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('two');
		var result = rule.isValid(obj, prop, 'ok_notinlist');
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooNotInListTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('two');
		var msg = rule.getMessage(obj, prop, 'ok_notinlist');
		assertEquals('Property must not be one of the following values: one,two,three.', msg);
	}
	
}