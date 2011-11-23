component extends="PropertyRule" {

	variables.attributeNames = ['ok_notinlist'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var list = md[key];
		
		if(listFindNoCase(list,val)){
			return false;
		}
		
		return true;
	}

}