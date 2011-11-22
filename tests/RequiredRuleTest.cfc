component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup() {
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.RequiredRule(messageProvider);
	}
	
	public void function testColumnRequiredPasses(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('Test');
		var result = rule.isValid(obj,prop,'ok_required');
		assertTrue(result);
	}
	
	public void function testColumnRequiredFails(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setProperty('');
		var result = rule.isValid(obj,prop,'ok_required');
		assertFalse(result);
	}
	
	public void function testO2ORequiredPasses(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var fooTypeTest = new ok.tests.entities.FooTypeTest();		
		var md = getMetadata(obj);
		var prop = md.properties[3];
		obj.setFooTypeTest(fooTypeTest);
		var result = rule.isValid(obj,prop,'ok_required');
		assertTrue(result);
	}
	
	public void function testO2ORequiredFails(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var md = getMetadata(obj);
		var prop = md.properties[3];
		var result = rule.isValid(obj,prop,'ok_required');
		assertFalse(result);
	}
	
	public void function testO2MRequiredPasses(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var fooTypeTest = new ok.tests.entities.FooTypeTest();		
		var md = getMetadata(obj);
		var prop = md.properties[4];
		obj.addFooTypeTests(fooTypeTest);
		var result = rule.isValid(obj,prop,'ok_required');
		assertTrue(result);
	}
	
	public void function testO2MRequiredFails(){
		var obj = new ok.tests.entities.FooRequiredTest();
		var md = getMetadata(obj);
		var prop = md.properties[4];
		var result = rule.isValid(obj,prop,'ok_required');
		assertFalse(result);
	}

}