component entityname="FooLengthTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" length="5" ok_validate="length";

}