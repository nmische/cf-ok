component entityname="FooPasswordTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" ok_password="5,15,medium";

}