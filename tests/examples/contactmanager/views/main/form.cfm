<cfoutput>
<h2>Contact</h2>

<cfif structKeyExists(rc,"validationErrors")>
	<ul style="color:red">
		<cfloop array="#rc.validationErrors.getErrors()#" index="error">
			<li>#error.getMessage()#</li>
		</cfloop>
	</ul>
</cfif>

<form action="#buildUrl(rc.formAction)#" method="post">
<dl>
	
	<dt>First Name:</dt>
	<dd><input type="text" name="firstName" value="#rc.contact.getFirstName()#"/></dd>
	
	<dt>Last Name:</dt>
	<dd><input type="text" name="lastName" value="#rc.contact.getLastName()#"/></dd>
	
	<dt>Email:</dt>
	<dd><input type="text" name="email" value="#rc.contact.getEmail()#"/></dd>
	
	<dt>Phone Number:</dt>
	<dd><input type="text" name="phone" value="#rc.contact.getPhone()#"/></dd>
	
	<dt>&nbsp;</dt>
	<dd><input type="submit" value="#rc.formLabel#"/></dd>	
	
</dl>

<input type="hidden" name="id" value="#rc.contact.getId()#"/>
</form>
</cfoutput>