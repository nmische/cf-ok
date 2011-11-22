component extends="ComponentRule" {

	variables.attributeNames = ['ok_unique'];

	function isValid(obj, md, key) {
		
		var cols = md[key];
		var entityName = structKeyExists(md,'entityName') ? md.entityName : listLast(md.name,'.');
		
		var q = new query(dbtype="hql");
		var hql = "from #entityName# where 1=1";
		for( var i=1; i <= listLen(cols); i++ ) {
			var col = listGetAt(cols,i);
			hql &= " and #col# = ?";
			q.addParam(value=getValue(obj,col),cfsqltype='varchar',null=isNull(getValue(obj,col)));
		}
		q.setSQL(hql);
		var result = q.execute();
		
		return ArrayLen(result.getResult()) == 0;
		
	}

}