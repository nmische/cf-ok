component entityname="FooNotInListTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="property" type="string" ormtype="string" ok_notinlist="one,two,three";

}