component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();	
	}

	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.TypeRule(messageProvider);
	}	
	
	public void function testRulePasses(){
		var obj = new ok.tests.entities.FooTypeTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Test');
		var result = rule.isValid(obj, prop, 'type');
		assertTrue(result);
	}
	
	public void function testRuleFails(){
		/* nothing */
	}
	
	public void function testRuleReturnsMessage(){
		/* nothing */
	}

	
	
}