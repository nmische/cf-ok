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
			
		return arrayLen(found) == 0;
		
	}

}