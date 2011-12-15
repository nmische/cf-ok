component extends="ComponentRule" {

	variables.attributeNames = ['ok_unique'];

	function isValid(obj, md, key) {
		
		var filter = {};
		var props = md[key];
		var entityName = structKeyExists(md,'entityName') ? md.entityName : listLast(md.name,'.');
		for( var i=1; i <= listLen(props); i++ ) {
			var prop = listGetAt(props,i);
			filter[prop] = getValue(obj,prop);			
		}		
		var found = entityLoad(entityName,filter);
		
		// if no others are found then it is unique
		if ( arrayLen(found) == 0 ) {
			return true;
		}
		
		// if one is found, make sure it matches the obj
		if ( arrayLen(found) == 1 ) {
			return arrayFind(found,obj);	
		}

		// if more than one found then it is definitely not unique
		return false;

	}

}