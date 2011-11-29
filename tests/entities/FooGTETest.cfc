component entityname="FooGTETest" persistent="true" ok_gte="firstProp,secondProp" {

	property name="id" fieldtype="id" generator="native";
	property name="firstProp" type="numeric" ormtype="integer";
	property name="secondProp" type="numeric" ormtype="integer";

}