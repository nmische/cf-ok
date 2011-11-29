component extends="PropertyRule" {

	variables.attributeNames = ['type','ormtype'];

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
			case 'serializable':
			case 'blob':
			case 'clob':
				return isBinary(val);
				break;
				
			case 'boolean':
			case 'yes_no':
			case 'true_false':
				return isBoolean(val);
				break;
				
			case 'date':
			case 'timestamp':
				return isDate(val);
				break;
				
			case 'guid':
				return isValid('guid',val);
				break;
				
			case 'integer':
			case 'int':
				return isValid('integer',val);
				break;
				
			case 'numeric':
			case 'short':
			case 'long':
			case 'big_decimal':
			case 'float':
			case 'double':
				return isNumeric(val);
				break;
				
			case 'query':
				return isQuery(val);
				break;
				
			case 'string':
			case 'character':
			case 'char':
			case 'text':
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
				return isInstanceOf(val,prop[key]);
				break;
			
		}
		
	}

}