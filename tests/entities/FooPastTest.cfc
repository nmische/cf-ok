component entityname="FooPastTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="nowProp" type="date" ormtype="date" ok_past="true";
	property name="targetProp" type="date" ormtype="date" ok_past="1/1/2011";

}