component entityname="FooLTETest" persistent="true" ok_lte="firstProp,secondProp" {

	property name="id" fieldtype="id" generator="native";
	property name="firstProp" type="numeric" ormtype="integer";
	property name="secondProp" type="numeric" ormtype="integer";

}