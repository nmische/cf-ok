component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.MatchRule(messageProvider);
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooMatchTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('test');
		var result = rule.isValid(obj, md, 'ok_match');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooMatchTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		var result = rule.isValid(obj, md, 'ok_match');
		assertFalse(result);		
	}
	
	public void function testRuleWithThreeValuesPasses(){
		var obj = new ok.tests.entities.FooMatchThreeTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('test');
		obj.setThirdProp('test');
		var result = rule.isValid(obj, md, 'ok_match');
		assertTrue(result);
	}
	
	public void function testRuleWithThreeValuesFails(){
		var obj = new ok.tests.entities.FooMatchThreeTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		obj.setThirdProp('test');
		var result = rule.isValid(obj, md, 'ok_match');
		assertFalse(result);		
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooMatchTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		var msg = rule.getMessage(obj, md, 'ok_match');
		assertEquals('The following must match: first prop, second prop.',msg);
	}

}