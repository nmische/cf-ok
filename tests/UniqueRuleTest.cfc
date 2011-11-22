component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.UniqueRule(messageProvider);
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooUniqueTest();
		var md = getMetadata(obj);
		obj.setFirstName('First');
		obj.setLastName('Last');
		var result = rule.isValid(obj, md, 'ok_unique');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var first = new ok.tests.entities.FooUniqueTest();
		first.setFirstName('First');
		first.setLastName('Last');
		EntitySave(first);
		
		var obj = new ok.tests.entities.FooUniqueTest();
		var md = getMetadata(obj);
		obj.setFirstName('First');
		obj.setLastName('Last');
		var result = rule.isValid(obj, md, 'ok_unique');
		assertFalse(result);
		
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooUniqueTest();
		var md = getMetadata(obj);
		obj.setFirstName('First');
		obj.setLastName('Last');
		var msg = rule.getMessage(obj, md, 'ok_unique');
		assertEquals('foo unique test must be unique.',msg);
	}

}