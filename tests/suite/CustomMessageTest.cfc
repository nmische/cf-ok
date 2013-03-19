component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		ormReload();
		messageProvider = new ok.MessageProvider(); 
		matchRule = new ok.rules.MatchRule(messageProvider);
		typeRule = new ok.rules.TypeRule(messageProvider);
		ormClearSession();
	}	
	
	public void function testComponentRuleReturnsCustomMessage(){
		var obj = new ok.tests.entities.FooMessageTest();
		var md = getMetadata(obj);
		obj.setFirstProp('test');
		obj.setSecondProp('testing');
		var msg = matchRule.getMessage(obj, md, 'ok_match');
		assertEquals('Test component message.',msg);
	}
	
	public void function testPropertyRuleReturnsCustomMessage(){
		var obj = new ok.tests.entities.FooMessageTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty({key='value'});
		var msg = typeRule.getMessage(obj, prop, 'ormtype');
		assertEquals('Test property message.',msg);
	}

}