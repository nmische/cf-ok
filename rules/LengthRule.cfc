component extends="PropertyRule" {

	variables.attributeNames = ['length'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var maxLength = md[key];
		
		if (isNull(val)) return true;
		
		return (len(val) <= maxLength); 
	}

}