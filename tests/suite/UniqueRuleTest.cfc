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
		entitySave(first);
		
		var obj = new ok.tests.entities.FooUniqueTest();
		var md = getMetadata(obj);
		obj.setFirstName('First');
		obj.setLastName('Last');
		var result = rule.isValid(obj, md, 'ok_unique');
		assertFalse(result);
		
	}
	
	public void function testRuleUpdatePasses(){
		var first = new ok.tests.entities.FooUniqueTest();
		first.setFirstName('Test');
		first.setLastName('Test');
		first.setNickName('Test');
		entitySave(first);
		ormFlush();
		var id = first.getId();
		
		// now load a second instance of the object
		var obj = entityLoad('FooUniqueTest',id,true);
		var md = getMetadata(obj);
		obj.setNickName('Testing');
		var result = rule.isValid(obj, md, 'ok_unique');
		assertTrue(result);
		
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooUniqueTest();
		var md = getMetadata(obj);
		obj.setFirstName('First');
		obj.setLastName('Last');
		var msg = rule.getMessage(obj, md, 'ok_unique');
		assertEquals('Foo unique test must be unique.',msg);
	}

}