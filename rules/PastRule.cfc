component extends="PropertyRule" {

	variables.attributeNames = ['ok_past'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var limit = isDate(md[key]) ? md[key] : now();
				
		if(dateCompare(val,limit) == -1){
			return true;
		}
		
		return false;
	}

	function getMessage(obj, md, key) {
		var rawMessage = structKeyExists(md, "ok_message") ? md.ok_message : getMessageProvider().getMessage(key);
		var display = structKeyExists(md,"display") ? md.display : humanize(listLast(md.name,'.'));
		var keyVal = isDate(md[key]) ? md[key] : now();
		keyVal = dateFormat(keyVal);
		rawMessage = Replace(rawMessage,'{display}',display,'all');
		rawMessage = Replace(rawmessage,'{#lcase(key)#}',keyVal,'all');
		return trim(rawMessage);
	}

}