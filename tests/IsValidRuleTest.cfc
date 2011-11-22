component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		messageProvider = new ok.MessageProvider(); 
		rule = new ok.rules.IsValidRule(messageProvider);
	}
	
	public void function testAnyPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[2];
		obj.setAnyProp('Test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testAnyFails(){
		/* nothing */
	}
	
	public void function testArrayPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[3];
		obj.setArrayProp(['one','two']);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testArrayFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[3];
		obj.setArrayProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		debug(result);
		assertFalse(result);
	}
	
	public void function testBinaryPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[4];
		obj.setBinaryProp(toBinary(toBase64('test')));
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testBinaryFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[4];
		obj.setBinaryProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testBooleanPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[5];
		obj.setBooleanProp('true');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testBooleanFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[5];
		obj.setBooleanProp('fail');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testComponentPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[6];
		obj.setComponentProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testComponentFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = 'test';
		var md = getMetadata(obj);
		var prop = md.properties[6];
		obj.setComponentProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testCreditCardPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[7];
		obj.setCreditCardProp('378282246310005');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testCreditCardFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[7];
		obj.setCreditCardProp('178282241310005');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testDatePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[8];
		obj.setDateProp('12/25/2011');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}	
	
	public void function testDateFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[8];
		obj.setDateProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testTimePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = createTime(12,0,0);
		var md = getMetadata(obj);
		var prop = md.properties[9];
		obj.setTimeProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}	
	
	public void function testTimeFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = 'test';
		var md = getMetadata(obj);
		var prop = md.properties[9];
		obj.setTimeProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testEmailPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[10];
		obj.setEmailProp('test@example.com');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}	
	
	public void function testEmailFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[10];
		obj.setEmailProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testEurodatePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[11];
		obj.setEurodateProp('25/12/2011');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testEurodateFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[11];
		obj.setEurodateProp('12/25/2011');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testFloatPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[12];
		obj.setFloatProp(1.23);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testFloatFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[12];
		obj.setFloatProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testNumericPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[13];
		obj.setNumericProp(1.23);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testNumericFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[13];
		obj.setNumericProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testGuidPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[14];
		obj.setGuidProp('505560c0-1474-11e1-be50-0800200c9a66'); // GUID
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testGuidFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[14];
		obj.setGuidProp('505560c0-1474-11e1-be500800200c9a66'); // UUID
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testIntegerPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[15];
		obj.setIntegerProp(1);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testIntegerFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[15];
		obj.setIntegerProp(1.23); 
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testQueryPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = queryNew('col1,col2,col3');
		var md = getMetadata(obj);
		var prop = md.properties[16];
		obj.setQueryProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testQueryFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = 'test';
		var md = getMetadata(obj);
		var prop = md.properties[16];
		obj.setQueryProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testRangeMinMaxPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[17];
		obj.setRangeMinMaxProp(7);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testRangeMinMaxFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[17];
		obj.setRangeMinMaxProp(25);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testRangeMinPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[18];
		obj.setRangeMinProp(1500);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testRangeMinFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[18];
		obj.setRangeMinProp(-1501);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testRangeMaxPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[19];
		obj.setRangeMaxProp(-1500);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testRangeMaxFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[19];
		obj.setRangeMaxProp(1501);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testRegExPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[20];
		obj.setRegExProp('hello');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testRegExFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[20];
		obj.setRegExProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testRegularExpressionPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[21];
		obj.setRegularExpressionProp('hello');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testRegularExpressionFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[21];
		obj.setRegularExpressionProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testSSNPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[22];
		obj.setSSNProp('123-45-6789');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testSSNFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[22];
		obj.setSSNProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testSocialSecurityNumberPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[23];
		obj.setSocialSecurityNumberProp('123-45-6789');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testSocialSecurityNumberFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[23];
		obj.setSocialSecurityNumberProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testStringPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[24];
		obj.setStringProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testStringFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var val = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[24];
		obj.setStringProp(val);
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testStructPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[25];
		obj.setStructProp({key = 'value'});
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testStructFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[25];
		obj.setStructProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testTelephonePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[26];
		obj.setTelephoneProp('123-456-7890');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testTelephoneFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[26];
		obj.setTelephoneProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testURLPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[27];
		obj.setURLProp('http://www.google.com');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testURLFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[27];
		obj.setURLProp('test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testUuidPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[28];
		obj.setUuidProp('505560c0-1474-11e1-be500800200c9a66'); // UUID
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testUuidFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[28];
		obj.setUuidProp('505560c0-1474-11e1-be50-0800200c9a66'); // GUID		
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testUSDatePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[29];
		obj.setUSDateProp('12/25/2011');		
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testUSDateFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[29];
		obj.setUSDateProp('25/12/2011');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testVariableNamePasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[30];
		obj.setVariableNameProp('$test');		
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testVariableNameFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[30];
		obj.setVariableNameProp('1test');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}
	
	public void function testZipCode5Passes(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[31];
		obj.setZipCodeProp('19104');		
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testZipCode9Passes(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[31];
		obj.setZipCodeProp('19104-6301');		
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertTrue(result);
	}
	
	public void function testZipCodeFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		var md = getMetadata(obj);
		var prop = md.properties[31];
		obj.setZipCodeProp('1111');
		var result = rule.isValid(obj, prop, 'ok_isvalid');
		assertFalse(result);
	}

}