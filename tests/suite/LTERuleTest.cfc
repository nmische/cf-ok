component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.LTERule(messageProvider);
		ormClearSession();
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooLTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(1);
		obj.setSecondProp(2);
		var result = rule.isValid(obj, md, 'ok_lte');
		assertTrue(result);
	}
	
	public void function testNullPasses(){
		var obj = new ok.tests.entities.FooLTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(1);
		var result = rule.isValid(obj, md, 'ok_lte');
		assertTrue(result);
	}
	
	public void function testBlankPasses(){
		var obj = new ok.tests.entities.FooLTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(1);
		obj.setSecondProp('');
		var result = rule.isValid(obj, md, 'ok_lte');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooLTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(2);
		obj.setSecondProp(1);
		var result = rule.isValid(obj, md, 'ok_lte');
		assertFalse(result);		
	}
		
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooLTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(2);
		obj.setSecondProp(1);
		var msg = rule.getMessage(obj, md, 'ok_lte');
		assertEquals('First prop must be less than or equal to second prop.',msg);
	}

}