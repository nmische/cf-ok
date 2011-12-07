component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		validator = new ok.Validator(rulesDirectory=expandPath('customRules'), rulesCfcPath='ok.tests.customrules');
	}
	
	public void function testInit(){
		debug(validator.getPropertyRules());
		debug(validator.getComponentRules());
		assertTrue(true);
	}

	
	public void function testCustomRuleLoaded(){
		var rules = structKeyList(validator.getPropertyRules());
		assertTrue(listFindNoCase(rules,'ok_compare'));
	}
	
	public void function customRulePasses(){
		var obj = new ok.tests.entities.FooCompareTest();
		obj.setProperty('test');
		var vr = validator.validate(obj);
		assertFalse(vr.hasErrors());
	}
	
	public void function customRuleFails(){
		var obj = new ok.tests.entities.FooCompareTest();
		obj.setProperty('testing');
		var vr = validator.validate(obj);
		assertTrue(vr.hasErrors());
	}
}