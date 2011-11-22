component entityname="FooPersonArray" persistent="true" ok_unique="firstName,lastName" {

	property name="id" fieldtype="id" generator="native";
	property name="firstName" type="string" ormtype="string";
	property name="lastName" type="string" ormtype="string";
	property name="phone" type="string" ormtype="string" ok_isvalid="telephone";
	property name="children" singularname="child" fieldtype="one-to-many" cfc="FooPersonArray" fkcolumn="parentID" ok_validate="true";
	property name="parent" fieldtype="many-to-one" cfc="FooPersonArray" fkcolumn="parentID" inverse="true";

}