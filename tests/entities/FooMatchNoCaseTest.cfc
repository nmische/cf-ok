component entityname="FooMatchNoCaseTest" persistent="true" ok_matchnocase="firstProp,secondProp" {

	property name="id" fieldtype="id" generator="native";
	property name="firstProp" type="string" ormtype="string";
	property name="secondProp" type="string" ormtype="string";

}