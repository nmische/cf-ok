component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.FutureRule(messageProvider);
		ormClearSession();
	}
	
	public void function testRuleNowPasses(){
		var obj = new ok.tests.entities.FooFutureTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setNowProp(dateAdd('d',1,now()));
		var result = rule.isValid(obj, prop, 'ok_future');
		assertTrue(result);
	}
	
	public void function testRuleNowFails(){
		var obj = new ok.tests.entities.FooFutureTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setNowProp(dateAdd('d',-1,now()));
		var result = rule.isValid(obj, prop, 'ok_future');
		assertFalse(result);
	}
	
	public void function testRuleTargetPasses(){
		var obj = new ok.tests.entities.FooFutureTest();
		var md = getMetadata(obj);
		var prop = md.properties[3];
		obj.setTargetProp(createDate(2011,2,2));
		var result = rule.isValid(obj, prop, 'ok_future');
		assertTrue(result);
	}
	
	public void function testRuleTargetFails(){
		var obj = new ok.tests.entities.FooFutureTest();
		var md = getMetadata(obj);
		var prop = md.properties[3];
		obj.setTargetProp(createDate(2010,1,1));
		var result = rule.isValid(obj, prop, 'ok_future');
		assertFalse(result);
	}
	
	public void function testRuleReturnsMessage(){
		var obj = new ok.tests.entities.FooFutureTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setNowProp(dateAdd('d',-1,now()));
		var msg = rule.getMessage(obj, prop, 'ok_future');
		assertEquals('Now prop is not after #dateFormat(now())#.', msg);
	}
	
}