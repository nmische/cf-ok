<cfoutput>
<h2>Contacts</h2>

<table border="1">
	<tr>
		<th>Name</th>
		<th>Email</th>
		<th>Phone Number</th>
		<th>Action</th>
	</tr>
	<cfloop array="#rc.contacts#" index="contact">
	<form action="#buildURL('main.update')#" method="post">
	<tr>
		<td>#contact.getFullName()# &nbsp;</td>
		<td>#contact.getEmail()# &nbsp;</td>
		<td>#contact.getPhone()# &nbsp;</td>
		<td>
			<a href="#buildURL(action='main.update', queryString='id=#contact.getId()#')#">Update</a>
			| <a href="#buildURL(action='main.doDelete', queryString='id=#contact.getId()#')#">Delete</a>				
		</td>
	</tr>
	</cfloop>	
</table>

<br/>

<form>
	<input type="hidden" name="action" value="main.create"/>
	<input type="submit" value="Add Contact" />
</form>
</cfoutput>