component entityname="FooPersonStruct" persistent="true" ok_unique="firstName,lastName" {

	property name="id" fieldtype="id" generator="native";
	property name="firstName" type="string" ormtype="string";
	property name="lastName" type="string" ormtype="string";
	property name="phone" type="string" ormtype="string" ok_isvalid="telephone";
	property name="children" singularname="child" type="struct" structkeycolumn="id" structkeytype="int" fieldtype="one-to-many" cfc="FooPersonStruct" fkcolumn="parentID" ok_validate="true";
	property name="parent" fieldtype="many-to-one" cfc="FooPersonStruct" fkcolumn="parentID" inverse="true";

}