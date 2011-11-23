component extends="PropertyRule" {

	variables.attributeNames = ['ok_assertfalse'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		
		if(!isBoolean(val) || val){
			return false;
		}
		
		return true;
	}

}