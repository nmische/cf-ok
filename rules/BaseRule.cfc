<cfcomponent accessors="true">
	
	<cfproperty name="messageProvider" type="ok.MessageProvider" />
	<cfproperty name="attributeNames" type="array" />
	
	<cfscript>
	
	function init(messageProvider) {
		setMessageProvider(arguments.messageProvider);
		return this;
	}
	
	function getMessage(obj, md, key) {
		var rawMessage = getMessageProvider().getMessage(key);
		var display = structKeyExists(md,"display") ? md.display : humanize(listLast(md.name,'.'));
		var keyVal = md[key];
		rawMessage = Replace(rawMessage,'{display}',display,'all');
		rawMessage = Replace(rawmessage,'{#lcase(key)#}',keyVal,'all');
		return trim(rawMessage);
	}
		
	function getAttributeNames() {
		return isNull(variables.attributeNames) ? [] : variables.attributeNames;
	}
	
	private function humanize(text) {
		var returnValue = reReplace(arguments.text, "([[:upper:]])", " \1", "all");
		returnValue = reReplace(returnValue, "([[:upper:]]) ([[:upper:]]) ", "\1\2", "all");
		returnValue = replace(returnValue, "-", " ", "all"); 
		returnValue = ucase(left(returnValue,1)) & right(returnValue,len(returnValue)-1);
		return returnValue;
	}
	
	</cfscript>	
	
	<cffunction name="getValue">
		<cfargument name="obj"/>
		<cfargument name="prop"/>
		<cfset var val = "" />
		<cfinvoke component="#obj#" method="get#prop#" returnvariable="val" />
		<cfif !isNull(val)>
			<cfreturn val />
		</cfif>
	</cffunction>
	
</cfcomponent>