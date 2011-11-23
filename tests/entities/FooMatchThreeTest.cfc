component entityname="FooMatchThreeTest" persistent="true" ok_match="firstProp,secondProp,thirdProp" {

	property name="id" fieldtype="id" generator="native";
	property name="firstProp" type="string" ormtype="string";
	property name="secondProp" type="string" ormtype="string";
	property name="thirdProp" type="string" ormtype="string";

}