component entityname="FooAssertTrueTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="boolean" ormtype="boolean" ok_asserttrue="true";

}