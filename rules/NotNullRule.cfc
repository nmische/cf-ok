component extends="PropertyRule" {

	variables.attributeNames = ['notnull'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		return !isNull(val);
	}

}