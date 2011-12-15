component extends="PropertyRule" {

	variables.attributeNames = ['length'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var maxLength = md[key];
		
		if ( isNull(val) || (isSimpleValue(val) && len(val) eq 0) )  return true;
		
		return (len(val) <= maxLength); 
	}

}