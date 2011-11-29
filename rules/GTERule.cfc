component extends="ComponentRule" {

	variables.attributeNames = ['ok_gte'];

	function isValid(obj, md, key) {
		
		var props = md[key];
		var vals = [];
		
		// collect values
		for( var i=1; i <= listLen(props); i++ ) {
			var prop = trim(listGetAt(props,i));
			var val = getValue(obj, prop);
			if (!isNull(val)) {
				arrayAppend(vals,val);
			}
		}
		
		// we may not have values for some of the targeted properties
		if (arrayLen(vals) eq 2) {
			return vals[1] lte vals[2];
		} 
		
		return true;
	}
	
	function getMessage(obj, md, key) {
		var rawMessage = structKeyExists(md, "ok_message") ? md.ok_message : getMessageProvider().getMessage(key);
		var display = structKeyExists(md,"display") ? md.display : humanize(listLast(md.name,'.'));
		var props = md[key];
		var keyVal = "";
		var delim = "";
		for( var i=1; i <= listLen(props); i++ ) {
			var prop = humanize(trim(listGetAt(props,i)));
			rawMessage = Replace(rawMessage,'{prop#i#}',prop,'all');
			keyVal =  keyVal & delim & prop;
			delim = ", ";
		}		
		rawMessage = Replace(rawMessage,'{display}',display,'all');
		rawMessage = Replace(rawmessage,'{#lcase(key)#}',keyVal,'all');
		return trim(rawMessage);
	}

}