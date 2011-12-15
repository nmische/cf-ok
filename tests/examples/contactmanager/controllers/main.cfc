component {
	
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}
	
	public void function setOkValidator(okValidator) {
		variables.validator = okValidator;
	}
	
	public void function default(rc) {
		rc.contacts = entityLoad("contact");
		variables.fw.setView("main.list");		
	}
	
	public void function create(rc) {	
		if (!structKeyExists(rc,"contact"))
			rc.contact = entityNew("contact");
		rc.formAction = "main.doCreate";
		rc.formLabel = "Create";	
		variables.fw.setView("main.form");
	}
	
	public void function doCreate(rc) {
		rc.contact = entityNew("contact");
		variables.fw.populate(rc.contact);
		rc.validationErrors = variables.validator.validate(rc.contact);
		if (rc.validationErrors.hasErrors()) {
			variables.fw.redirect(action="main.create",preserve="contact,validationErrors");
		} else {
			entitySave(rc.contact);
			variables.fw.redirect("main.default");
		}		
	}
	
	public void function update(rc) {	
		if (!structKeyExists(rc,"contact"))
			rc.contact = entityLoad("contact",rc.id,true);	
		rc.formAction = "main.doUpdate";
		rc.formLabel = "Update";
		variables.fw.setView("main.form");
	}
	
	public void function doUpdate(rc) {
		rc.contact = entityLoad("contact",rc.id,true);
		variables.fw.populate(rc.contact);
		rc.validationErrors = variables.validator.validate(rc.contact);
		if (rc.validationErrors.hasErrors()) {
			variables.fw.redirect(action="main.update",preserve="contact,validationErrors");
		} else {
			entitySave(rc.contact);
			variables.fw.redirect("main.default");
		}		
	}
	
	public void function doDelete(rc) {
		var contact = entityLoad("contact",rc.id,true);
		entityDelete(contact);
		variables.fw.redirect("main.default");
	}
	
}