component entityname="FooAssertFalseTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="boolean" ormtype="boolean" ok_assertfalse="true";

}