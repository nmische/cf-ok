component extends="PropertyRule" {

	variables.attributeNames = ['ok_required'];

	function isValid(obj, md, key) {		
		var val = getValue(obj, md.name);
				
		// if null then not valid
		if (isNull(val)) {
			return false;
		}
		
		// if a empty string then not valid
		if (isSimpleValue(val) && len(trim(val)) == 0) {
			return false;
		}
		
		// else it has a value
		return true;
				
	}

}