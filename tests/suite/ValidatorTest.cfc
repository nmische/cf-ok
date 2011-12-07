component extends="mxunit.framework.TestCase" {

	public void function beforeTests() {
		ormReload();
	}
	
	public void function setup(){
		validator = new ok.Validator();
	}
	
	public void function testInit(){
		debug(validator.getPropertyRules());
		debug(validator.getComponentRules());
		assertTrue(true);
	}
	
	// IsValidRule
	
	public void function testIsValidPasses(){
		var obj = new ok.tests.entities.FooIsValidTest();
		obj.setStringProp('Test');
		var vr = validator.validate(obj);
		assertFalse(vr.hasErrors());
	}
	
	public void function testIsValidFails(){
		var obj = new ok.tests.entities.FooIsValidTest();
		obj.setNumericProp('Test');
		var vr = validator.validate(obj);
		assertTrue(vr.hasErrors());
	}
	
	// LengthRule
	
	public void function testLengthPasses(){
		var obj = new ok.tests.entities.FooLengthTest();
		obj.setProperty('Test');
		var vr = validator.validate(obj);
		assertFalse(vr.hasErrors());
	}
	
	public void function testLengthFails(){
		var obj = new ok.tests.entities.FooLengthTest();
		obj.setProperty('Testing');
		var vr = validator.validate(obj);
		assertTrue(vr.hasErrors());
	}
	
	// NotNullRule
	
	public void function testNotNullPasses(){
		var obj = new ok.tests.entities.FooNotNullTest();
		obj.setProperty('Test');
		var vr = validator.validate(obj);
		assertFalse(vr.hasErrors());
	}
	
	public void function testNotNullFails(){
		var obj = new ok.tests.entities.FooNotNullTest();
		var vr = validator.validate(obj);
		assertTrue(vr.hasErrors());
	}
	
	// TypeRule
	
	public void function testTypePasses(){
		var obj = new ok.tests.entities.FooTypeTest();
		obj.setProperty('Test');
		var vr = validator.validate(obj);
		assertFalse(vr.hasErrors());
	}
	
	// Nested Validation
	
	public void function nestedValidationPasses(){
		var parent = new ok.tests.entities.FooPersonArray();
		parent.setFirstName('John');
		parent.setLastName('Doe');
		parent.setPhone('123-456-7890');
		var child = new ok.tests.entities.FooPersonArray();
		child.setFirstName('Johnny');
		child.setLastName('Doe');
		parent.addChild(child);
		child.setParent(parent);
		var vr = validator.validate(parent);
		debug(vr);
		assertFalse(vr.hasErrors());
	}
	
	public void function nestedChildArrayPropertyValidationFails(){
		var parent = new ok.tests.entities.FooPersonArray();
		parent.setFirstName('John');
		parent.setLastName('Doe');
		parent.setPhone('123-456-7890');
		var child = new ok.tests.entities.FooPersonArray();
		child.setFirstName('Johnny');
		child.setLastName('Doe');
		child.setPhone('test');		
		parent.addChild(child);
		child.setParent(parent);
		
		var vr = validator.validate(parent);
		debug(vr);
		assertTrue(vr.hasErrors());
		
		var errors = vr.getErrors();
		assertEquals(1, arrayLen(errors));
		
		assertEquals('ok.tests.entities.FooPersonArray.children[1]',errors[1].getContext());
		assertEquals('ok.tests.entities.FooPersonArray',errors[1].getEntity());
		assertEquals('property',errors[1].getValidationLevel());
		assertEquals('phone',errors[1].getProperty());
		assertEquals('OK_ISVALID',errors[1].getValidationType());
		assertEquals('Phone is not a valid telephone.',errors[1].getMessage());
		
	}
	
	public void function doubleNestedChildArrayPropertyValidationFails(){
		var parent = new ok.tests.entities.FooPersonArray();
		parent.setFirstName('John');
		parent.setLastName('Doe');
		parent.setPhone('123-456-7890');
		
		var child = new ok.tests.entities.FooPersonArray();
		child.setFirstName('Johnny');
		child.setLastName('Doe');
		child.setPhone('test');
		
		parent.addChild(child);
		child.setParent(parent);
		
		var grandchild = new ok.tests.entities.FooPersonArray();
		grandchild.setFirstName('Jane');
		grandchild.setLastName('Doe');
		grandchild.setPhone('test');
		
		child.addChild(grandchild);
		grandchild.setParent(child);
		
		var vr = validator.validate(parent);
		debug(vr);
		assertTrue(vr.hasErrors());
		
		var errors = vr.getErrors();
		assertEquals(2, arrayLen(errors));
		
		assertEquals('ok.tests.entities.FooPersonArray.children[1]',errors[1].getContext());
		assertEquals('ok.tests.entities.FooPersonArray',errors[1].getEntity());
		assertEquals('property',errors[1].getValidationLevel());
		assertEquals('phone',errors[1].getProperty());
		assertEquals('OK_ISVALID',errors[1].getValidationType());
		assertEquals('Phone is not a valid telephone.',errors[1].getMessage());
		
		assertEquals('ok.tests.entities.FooPersonArray.children[1].children[1]',errors[2].getContext());
		assertEquals('ok.tests.entities.FooPersonArray',errors[2].getEntity());
		assertEquals('property',errors[2].getValidationLevel());
		assertEquals('phone',errors[2].getProperty());
		assertEquals('OK_ISVALID',errors[2].getValidationType());
		assertEquals('Phone is not a valid telephone.',errors[2].getMessage());		
		
	}
	
	public void function nestedChildStructPropertyValidationFails(){
				
		var parent = new ok.tests.entities.FooPersonStruct();
		parent.setFirstName('John');
		parent.setLastName('Doe');
		parent.setPhone('123-456-7890');
		
		var child = new ok.tests.entities.FooPersonStruct();
		child.setFirstName('Johnny');
		child.setLastName('Doe');
		child.setPhone('test');
		
		parent.addChild(8, child);
		child.setParent(parent);
		
		var vr = validator.validate(parent);
		debug(vr);
		assertTrue(vr.hasErrors());
		
		var errors = vr.getErrors();
		assertEquals(1, arrayLen(errors));
		
		assertEquals('ok.tests.entities.FooPersonStruct.children[8]',errors[1].getContext());
		assertEquals('ok.tests.entities.FooPersonStruct',errors[1].getEntity());
		assertEquals('property',errors[1].getValidationLevel());
		assertEquals('phone',errors[1].getProperty());
		assertEquals('OK_ISVALID',errors[1].getValidationType());
		assertEquals('Phone is not a valid telephone.',errors[1].getMessage());
		
	}

}