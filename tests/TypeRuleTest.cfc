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
	
	public void function testORMRulePasses(){
		var obj = new ok.tests.entities.FooORMTypeTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Test');
		var result = rule.isValid(obj, prop, 'ormtype');
		assertTrue(result);
	}
	
	public void function testORMRuleFails(){
		var obj = new ok.tests.entities.FooORMTypeTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty({key='value'});
		var result = rule.isValid(obj, prop, 'ormtype');
		assertFalse(result);
	}
	
	public void function testORMRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooORMTypeTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty({key='value'});
		var msg = rule.getMessage(obj,prop,'ormtype');
		assertEquals('Property is not of type string.', msg);
	}


}