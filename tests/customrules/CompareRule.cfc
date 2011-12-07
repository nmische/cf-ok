component extends="ok.rules.PropertyRule" {

	variables.attributeNames = ['ok_compare'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var expected = md[key];
		
		if(compare(val,expected) == 0){
			return true;
		}
		
		return false;
	}

}