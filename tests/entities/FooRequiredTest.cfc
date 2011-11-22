component entityname="FooRequiredTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" ok_required="true";
	property name="fooTypeTest" fieldtype="one-to-one" cfc="FooTypeTest" fkcolumn="fooTypeTestID" ok_required="true";
	property name="fooTypeTests" fieldtype="one-to-many" cfc="FooTypeTest" fkcolumn="fooTypeTestID" inversejoincolumn="fooRequiredTestID" linktable="required_type" ok_required="true";
	
}