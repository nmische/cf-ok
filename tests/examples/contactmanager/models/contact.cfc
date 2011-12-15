component entityname="contact" persistent="true" ok_unique="firstName,lastName" {

	property name="id" fieldtype="id" generator="native";
	property name="firstName" type="string" length="50" ormtype="string" ok_validate="type,length";
	property name="lastName" type="string" length="50" ormtype="string" notnull="true" ok_validate="type,length,notnull" ok_required="true";
	property name="phone" type="string" ormtype="string" length="25" ok_validate="type,length" ok_isvalid="telephone";
	property name="email" type="string" ormtype="string" length="512" ok_validate="type,length" ok_isvalid="email";	
	
	public string function getFullName() {
		var fullName = "";
		if (!isNull(getFirstName())) {
			fullName &= getFirstName() & " ";
		}
		fullName &= getLastName();
		return fullName;			
	}

}
