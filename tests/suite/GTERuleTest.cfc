component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.GTERule(messageProvider);
		ormClearSession();
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooGTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(2);
		obj.setSecondProp(1);
		var result = rule.isValid(obj, md, 'ok_gte');
		assertTrue(result);
	}
	
	public void function testNullPasses(){
		var obj = new ok.tests.entities.FooGTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(2);
		var result = rule.isValid(obj, md, 'ok_gte');
		assertTrue(result);
	}
	
	public void function testBlankPasses(){
		var obj = new ok.tests.entities.FooGTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(2);
		obj.setSecondProp('');
		var result = rule.isValid(obj, md, 'ok_gte');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooGTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(1);
		obj.setSecondProp(2);
		var result = rule.isValid(obj, md, 'ok_gte');
		assertFalse(result);		
	}
		
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooGTETest();
		var md = getMetadata(obj);
		obj.setFirstProp(1);
		obj.setSecondProp(2);
		var msg = rule.getMessage(obj, md, 'ok_gte');
		assertEquals('First prop must be greater than or equal to second prop.',msg);
	}

}