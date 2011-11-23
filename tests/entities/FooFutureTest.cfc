component entityname="FooFutureTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";
	property name="nowProp" type="date" ormtype="date" ok_future="true";
	property name="targetProp" type="date" ormtype="date" ok_future="1/1/2011";

}