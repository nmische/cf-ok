component entityname="FooIsValidTest" persistent="true" {

	property name="id" fieldtype="id" generator="native";  // 1
	property name="anyProp" type="string" ormtype="string" ok_isvalid="any"; // 2
	property name="arrayProp" type="any" ormtype="string" ok_isvalid="array"; // 3
	property name="binaryProp" type="any" ormtype="binary" ok_isvalid="binary"; // 4
	property name="booleanProp" type="any" ormtype="boolean" ok_isvalid="boolean"; // 5
	property name="componentProp" type="any" ormtype="string" ok_isvalid="component"; // 6	
	property name="creditCardProp" type="string" ormtype="string" ok_isvalid="creditcard"; // 7
	property name="dateProp" type="any" ormtype="date" ok_isvalid="date"; // 8
	property name="timeProp" type="any" ormtype="date" ok_isvalid="time"; // 9
	property name="emailProp" type="string" ormtype="string" ok_isvalid="email"; // 10
	property name="eurodateProp" type="any" ormtype="date" ok_isvalid="eurodate"; // 11
	property name="floatProp" type="any" ormtype="float" ok_isvalid="float"; // 12
	property name="numericProp" type="any" ormtype="float" ok_isvalid="numeric"; // 13
	property name="guidProp" type="string" ormtype="string" ok_isvalid="guid"; //14
	property name="integerProp" type="numeric" ormtype="integer" ok_isvalid="integer"; // 15	
	property name="queryProp" type="any" ormtype="string" ok_isvalid="query"; // 16
	property name="rangeMinMaxProp" type="numeric" ormtype="integer" ok_isvalid="range" ok_min="0" ok_max="10"; // 17
	property name="rangeMinProp" type="numeric" ormtype="integer" ok_isvalid="range" ok_min="-1500"; // 18
	property name="rangeMaxProp" type="numeric" ormtype="integer" ok_isvalid="range" ok_max="1500"; // 19
	property name="regexProp" type="string" ormtype="string" ok_isvalid="regex" ok_pattern="hello|goodbye"; // 20
	property name="regularExpressionProp" type="string" ormtype="string" ok_isvalid="regular_expression" ok_pattern="(hello|goodbye)"; //21
	property name="ssnProp" type="string" ormtype="string" ok_isvalid="ssn"; // 22
	property name="socialSecurityNumberProp" type="string" ormtype="string" ok_isvalid="social_security_number"; // 23
	property name="stringProp" type="any" ormtype="string" ok_isvalid="string"; // 24
	property name="structProp" type="any" ormtype="string" ok_isvalid="struct"; // 25
	property name="telephoneProp" type="string" ormtype="string" ok_isvalid="telephone"; // 26
	property name="urlProp" type="string" ormtype="string" ok_isvalid="url"; // 27
	property name="uuidProp" type="string" ormtype="string" ok_isvalid="uuid"; // 28
	property name="usDateProp" type="date" ormtype="date" ok_isvalid="usdate"; // 29
	property name="variableNameProp" type="string" ormtype="string" ok_isvalid="variableName"; // 30
	property name="zipcodeProp" type="string" ormtype="string" ok_isvalid="zipcode"; // 31

}