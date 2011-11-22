component entityname="FooUniqueTest" persistent="true" ok_unique="firstName,lastName" {

	property name="id" fieldtype="id" generator="native";
	property name="firstName" type="string" ormtype="string";
	property name="lastName" type="string" ormtype="string";

}