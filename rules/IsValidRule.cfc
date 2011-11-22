component extends="PropertyRule" {

	variables.attributeNames = ['ok_isvalid'];

	function isValid(obj, md, key) {
		
		var val = getValue(obj, md.name);
		
		if (isNull(val)) return true;
		
		switch (md[key]) {
			
			case 'any':
				return isSimpleValue(val);
				break;
			
			case 'range':
				var integer = createObject('java','java.lang.Integer');
				var max = (structKeyExists(md,'ok_max') ? md.ok_max : integer.MAX_VALUE);
				var min = (structKeyExists(md,'ok_min') ? md.ok_min : integer.MIN_VALUE);
				return isValid('range',val, min, max);
				break;
			
			case 'regex':
			case 'regular_expression':
			    return isValid('regex', val, md.ok_pattern);
				break;
			
			default:
				return isValid(md[key], val);
				break;
			
		}
		
	}

}