component entityname="FooORMTypeTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="any" ormtype="string" ok_validate="ormtype";

}