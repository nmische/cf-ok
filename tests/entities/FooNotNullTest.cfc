component entityname="FooNotNullTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" notnull="true" ok_validate="notnull";

}