component entityname="FooLTETest" persistent="true" ok_lte="firstProp,secondProp" {

	property name="id" fieldtype="id" generator="native";
	property name="firstProp" type="any" ormtype="string";
	property name="secondProp" type="any" ormtype="string";

}