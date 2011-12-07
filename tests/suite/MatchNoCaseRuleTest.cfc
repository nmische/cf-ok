component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.MatchNoCaseRule(messageProvider);
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooMatchNoCaseTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('tEsT');
		var result = rule.isValid(obj, md, 'ok_matchnocase');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		var obj = new ok.tests.entities.FooMatchNoCaseTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		var result = rule.isValid(obj, md, 'ok_matchnocase');
		assertFalse(result);		
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooMatchNoCaseTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		var msg = rule.getMessage(obj, md, 'ok_matchnocase');
		assertEquals('The following must match: first prop, second prop.',msg);
	}

}