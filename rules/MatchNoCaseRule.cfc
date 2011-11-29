component extends="ComponentRule" {

	variables.attributeNames = ['ok_matchnocase'];

	function isValid(obj, md, key) {
		
		var props = md[key];
		var vals = [];
		
		// collect values
		for( var i=1; i <= listLen(props); i++ ) {
			var prop = trim(listGetAt(props,i));
			arrayAppend(vals,getValue(obj, prop));
		}
		
		//compare values
		for( var j=1; j < arrayLen(vals); j++) {
			if (compareNoCase(vals[j],vals[j+1]) != 0) {
				return false;
			}
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
			keyVal =  keyVal & delim & prop;
			delim = ", ";
		}		
		rawMessage = Replace(rawMessage,'{display}',display,'all');
		rawMessage = Replace(rawmessage,'{#lcase(key)#}',keyVal,'all');
		return trim(rawMessage);
	}
}