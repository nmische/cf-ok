component entityname="FooTypeTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" ok_validate="type";

}