component accessors="true" {

	property name="errors" type="array";
	
	public function init(){
		setErrors([]);
		return this;
	}
	
	public function hasErrors() {
		return (ArrayLen(getErrors()) > 0); 
	}
	
	public function getErrors(){
		return variables.errors;
	}
	
	public function addError(context, entity, validationlevel, property, validationType, message){
		var validationError = new ok.ValidationError();
		
		validationError.setContext(arguments.context);
		validationError.setEntity(arguments.entity);
		validationError.setValidationlevel(arguments.validationlevel);
		validationError.setProperty(arguments.property);
		validationError.setvalidationType(arguments.validationType);
		validationError.setMessage(arguments.message);
		
		ArrayAppend(variables.errors,validationError);
	}

}
