component extends="PropertyRule" {

	variables.attributeNames = ['type'];

	function isValid(obj, md, key) {
		
		var val = getValue(obj, md.name);
		
		if (isNull(val)) return true;
		
		switch (md[key]) {
			
			case 'any':
				return true;
				break;
				
			case 'array':
				return isArray(val);
				break;
				
			case 'binary':
				return isBinary(val);
				break;
				
			case 'boolean':
				return isBoolean(val);
				break;
				
			case 'date':
				return isDate(val);
				break;
				
			case 'guid':
				return isValid('guid',val);
				break;
				
			case 'numeric':
				return isNumeric(val);
				break;
				
			case 'query':
				return isQuery(val);
				break;
				
			case 'string':
				return isSimpleValue(val);
				break;
				
			case 'struct':
				return isStruct(val);
				break;
				
			case 'uuid':
				return isValid('guid',val);
				break;
				
			case 'variableName':
				return isValid('variableName',val);
				break;
				
			default:
				return isInstanceOf(val,prop.type);
				break;				
			
		}
			
	}

}