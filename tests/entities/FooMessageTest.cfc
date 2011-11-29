component entityname="FooMessageTest" persistent="true" ok_match="firstProp,secondProp" ok_message="Test component message." {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="any" ormtype="string" ok_validate="ormtype" ok_message="Test property message.";
	property name="firstProp" type="string" ormtype="string";
	property name="secondProp" type="string" ormtype="string";

}