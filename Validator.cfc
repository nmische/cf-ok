component accessors="true" {

	property struct propertyRules;
	property struct componentRules;
	
	function init(rulesDirectory, rulesCfcPath, resourceBundle) {
		
		var propertyRules = {};
		var componentRules = {};
		
		var messageProvider = new MessageProvider(argumentcollection=arguments);
		
		// load default rules
		loadRules(expandPath('/ok/rules'), 'ok.rules', propertyRules, componentRules, messageProvider);
		
		// load custom rules
		if (structKeyExists(arguments,'rulesDirectory') && directoryExists(arguments.rulesDirectory)) {
			loadRules(arguments.rulesDirectory, arguments.rulesCfcPath, propertyRules, componentRules, messageProvider);
		}
		
		setPropertyRules(propertyRules);
		setComponentRules(componentRules);
		
		return this;
		
	}
		
	function validate(obj, md, vr, c) {
		
		var propertyRules = getPropertyRules();
		var componentRules = getComponentRules();
		var objMetaData = (isNull(arguments.md)) ?  getMetaData(arguments.obj) : arguments.md;
		var validationResult = (isNull(arguments.vr)) ? new ValidationResult() : arguments.vr;	
		var context = (isNull(arguments.c)) ? objMetaData.name : arguments.c;
		
		// recurse into any parent objects
		if( !isNull(objMetaData.extends) ) {	
			validate(arguments.obj, objMetaData.extends, validationResult, context);
		}
		
		// component level validation
		for(var attribute in objMetaData) {
			if( structKeyExists(componentRules,attribute) ) {
				var rule = componentRules[attribute];
				if (!rule.isValid(obj, objMetaData, attribute)) {
					var msg = rule.getMessage(obj, objMetaData, attribute);
					validationResult.addError(
						context,
						objMetaData.name,
						'component',
						'',
						attribute,
						msg);
				}
			}
		}
		
		// property level validation
		var props = (isNull(objMetaData.properties)) ? [] : objMetaData.properties;
		
		for(var i=1; i <= ArrayLen(props); i++) {
			
			var prop = props[i];
			var attributeList = (structKeyExists(prop,'ok_validate')) ? prop.ok_validate : '';
			var fieldType = (structKeyExists(prop,'fieldType')) ? prop.fieldType : 'column';
			
			// columns
			if (fieldType == 'column') {
				
				for(var attribute in prop) {
				
					if( structKeyExists(propertyRules,attribute) 
						&& ( left(attribute,3) == 'ok_' || listFindNoCase(attributeList,attribute) ) ) {
						
						var rule = propertyRules[attribute];
						
						if (!rule.isValid(obj, prop, attribute)) {
							var msg = rule.getMessage(obj, prop, attribute);
							validationResult.addError(
								context,
								objMetaData.name,
								'property',
								prop.name,
								attribute,
								msg);
						}
						
					}
					
				}
				
			}
			
			// relationships
			if ( (fieldType == 'one-to-one' 
				|| fieldType == 'one-to-many'
                    || fieldType == 'many-to-one'
                        || fieldType == 'many-to-many')
                            && (!structKeyExists(prop,'inverse') 
                                || prop.inverse == false) ) {
				
				
				for(var attribute in prop) {
				
					if( structKeyExists(propertyRules,attribute) 
						&& ( left(attribute,3) == 'ok_' || listFindNoCase(attributeList,attribute) ) ) {
						
						var rule = propertyRules[attribute];
						
						if (!rule.isValid(obj, prop, attribute)) {
							var msg = rule.getMessage(obj, prop, attribute);
							validationResult.addError(
								context,
								objMetaData.name,
								'property',
								prop.name,
								attribute,
								msg);
						}
						
					}
					
					// nested validation
					if( attribute == 'ok_validate') {
						var children = evaluate('obj.get#prop.name#()');
						
						if(!isNull(children)){
							
							if(isArray(children)){
								for(var j = 1; j <= arrayLen(children); j++) {
									var currentContext = context & '.' & prop.name & '[' & j & ']';
									validate(obj=children[j],vr=validationResult,c=currentContext);
								} 
								
							}
							
							if(isStruct(children)){
								var keyType = (structKeyExists(prop,'structkeytype')) ? prop.structkeytype : 'string';
								for(var key in children) {
									var currentContext = context & '.' & prop.name & '[' & key & ']';
									validate(obj=children.get(javaCast(keytype,key)),vr=validationResult,c=currentContext);
								}
							}
							
							if(isObject(children)){
								var currentContext = context & '.' & prop.name;
								validate(obj=children,vr=validationResult,c=currentContext);
							}	
							
						}
						
					}
					
				}
				
			}
			
		}
		
		return validationResult;
		
	}
	
	private function loadRules(path, cfcPath, propertyRules, componentRules, messageProvider) {
		var ruleFiles = directoryList(arguments.path,false,'name');
		var dotPath = (right(arguments.cfcPath,1) == '.') ? arguments.cfcPath : arguments.cfcPath & '.';
		
		for(var ruleFile in ruleFiles) {
			var cfcName = dotPath & getToken(ruleFile,1,'.');
			var rule = createObject(cfcName).init(arguments.messageProvider);
			
			for(var attributeName in rule.getAttributeNames()){
				
				if (isInstanceOf(rule,'ok.rules.PropertyRule')) {
					arguments.propertyRules[attributeName] = rule;
				}
				
				if (isInstanceOf(rule,'ok.rules.ComponentRule')) {
					arguments.componentRules[attributeName] = rule;
				}
				
			}
		}
		
	}

}