component extends="PropertyRule" {

	variables.attributeNames = ['ok_password'];

	function isValid(obj, md, key) {
		var val = getValue(obj, md.name);
		var min = listGetAt(md[key],1);
		var max = listGetAt(md[key],2);
		var level = "low";

		if(listLen(md[key]) == 3){
			level = listGetAt(md[key],3);
		}
		
		// check the min and max
		if( len(val) < min || len(val) > max ) {
			return false;
		}

		// check the security level
		switch(level){
			case "low" : {
				// on low security level this is our only check
				if(val == "password") {
					return false;
					break;
				}
				break;
			}
			case "medium" : {
				// on medium the password must contain letters and numbers
				if( arrayLen(reMatchNocase("[a-zA-Z]",val)) == 0 
						|| arrayLen(reMatchNocase("[0-9]",val)) == 0 ){
					return false;
					break;
				}
				break;
			}
			case "high" : {
				// on high the password must contain letters, numbers & special characters
				if( arrayLen(reMatchNocase("[a-zA-Z]",val)) == 0 
						|| arrayLen(reMatchNocase("[0-9]",val)) == 0 
							|| arrayLen(reMatchNoCase("[^\w]",val)) == 0 ){
					return false;
					break;
				}
				break;
			}
		}

		return true;
		
	}

	

}