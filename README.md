# OK! #

OK is a ColdFusion 9 ORM entity validation framework inspired by [Hyrule](http://hyrule.riaforge.org/).

## Installation ##

OK is intended to be installed like most other ColdFusion frameworks. You can:

* Extract the ok archive to your webroot (i.e. `{webroot}/ok`),
* Extract the ok archive to an alternate location and provide a global `/ok` mapping via the ColdFusion administrator,
* Extract the ok archive to a directory in your application (i.e. /lib) and provide a application level mapping to `/ok`.

## General Usage ##

### Step 1: Annotate Your Entities ###

The first step to using OK is to annotate your existing ORM entities with OK rule definitions. Take the following ORM entity:

```
component entityname="contact" persistent="true" {
    property name="id" fieldtype="id" generator="native";
    property name="firstName" type="string" length="50" ormtype="string";
    property name="lastName" type="string" length="50" ormtype="string" notnull="true";
    property name="phone" type="string" ormtype="string" length="25";
    property name="email" type="string" ormtype="string" length="512";
}
```

Assume we want to confirm the following about this entity:

* there should be no entities with the same firstName and lastName,
* the firstName property should be a string no longer than 50 characters,
* the lastName property should be a non-empty string no longer than 50 characters,
* the phone property should be a valid phone number no longer than 23 characters in length,
* the phone property should be a valid email address no longer than 512 characters in length.

In order to apply these rules to this entity we could update our component definition as follows:

```
component entityname="contact" persistent="true" ok_unique="firstName,lastName" {
    property name="id" fieldtype="id" generator="native";
    property name="firstName" type="string" length="50" ormtype="string" ok_validate="type,length";
    property name="lastName" type="string" length="50" ormtype="string" notnull="true" ok_validate="type,length,notnull" ok_required="true";
    property name="phone" type="string" ormtype="string" length="25" ok_validate="type,length" ok_isvalid="telephone";
    property name="email" type="string" ormtype="string" length="512" ok_validate="type,length" ok_isvalid="email";
}
```

### Step 2: Populate The Entity ###

The next step is populating the entity with data. 

```
contact = new Contact({
    firstName="First",
    lastName="Last",
    phone="123-456-7890",
    email="first.last@example.com" });
```

### Step 3: Validate ###

The entry point into the framework is the `ok.Validator` component. Now that you have an entity that has been annotated and populated with data, we can use an instance of the `ok.Validator` object to validate it.

```
validator = new ok.Validator();
results = validator.validate(contact);
```

The `ok.Validator` component is intended to be instantiated as a singleton in your application and can take three optional constructor arguments:

* __rulesDirectory:__ The fully qualified path to a directory containing custom rule components. This argument must be used in conjunction with the rules rulesCfcPath argument. See the Custom Rules section below for more information.
* __rulesCfcPath:__ The dot delimited component path to the directory defined in the rulesDirectory argument.
* __resourceBundle:__ The fully qualified path to a properties file containing custom message definitions. See the Custom Messages section below for more information.

### Step 4: Evaluate Validation Results ###

The `ok.Validator`'s validate method returns an instance of the `ok.ValidationResult` component. The `ok.ValidationResult` object can then be used to check if any rules failed, and if so display information about those failures.

```
if (results.hasErrors()) {
    for (error in results.getErrors()) {
        WriteOutput(error.getMessage());
    }
}
```

The `ok.ValidationResult` component exposes the following methods:

* __hasErrors():__ Returns true if any rules failed validation. Returns false otherwise.
* __getErrors():__ Returns an array of `ok.ValidationError` objects, one for each rule that failed validation.

The `ok.ValidationError` has the following properties, which are accessible via generated getters:

* context: The context in which this validation error occurred. Useful for nested validations.
* entity: The entity this validation error applies to.
* validationLevel: The level this validation error occurred at, either 'component' or 'property'.
* property: If validaitonLevel is property, the property this error applies to.
* validationType: The type of validation that failed.
* message: A user friendly message describing the validation failure.

## Rules ##

OK validation rules may apply to either the entity as a whole or individual properties.

### Component Validation ###

Following is a list of pre-defined component level rules:

* __GTERule:__ Compares two property values, validating the first property is greater than or equal to the second property. 
* __LTERule:__ Compares two property values, validating the first property is less than or equal to the second property. 
* __MatchNoCaseRule:__ Does a case insensitive comparison of two or more property values. 
* __MatchRule:__ Does a case sensitive comparison of two or more property values. 
* __UniqueRule:__ Validates that an entity is unique based on a given property or list of properties. 

### Property Validation ###

Following is a list of pre-defined property level rules:

* __AssertFalseRule:__ Assert the property value is false.
* __AssertTrueRule:__ Assert the property value is true.
* __FutureRule:__ Check that the property value is a date after the given date. If no date is given (i.e. ok_future="true") then this rule compares the property value to the current date and time.
* __InListRule:__ Makes sure the property value is in the given list of values.
* __IsValidRule:__ Tests that the property value meets a validation or data type rule. The rules are the same as ColdFusion's built in [IsValid() funciton](http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fb9.html). If validating a range the optional attributes `ok_min` and `ok_max` may be specified. If validating a regular expression the required attribute `ok_pattern` must be defined.
* __NotInListRule:__ Makes sure the property value is not in the given list of values.
* __PasswordRule:__ Makes sure the property value meets security rules. Validation levels include: low (the default), medium, high.
* __PastRule:__ Check that the property value is a date before the given date. If no date is given (i.e. ok_past="true") then this rule compares the property value to the current date and time.
* __RequiredRule:__ Check that the property value is not null and not an empty string.

#### Validating Existing Property Attributes ####

ORM entity properties have many attributes such as `length` or `notnull` that you may want to validate. To do this simply define an `ok_validate` attribute on the property passing the name of the attribute, or a list of attributes, that you want to validate. 

```
    property name="lastName" type="string" length="50" ormtype="string" notnull="true" ok_validate="type,length,notnull";
```

Supported attributes include:

* type
* ormtype
* length
* notnull

#### Nested Valdation ####

OK supports validation of ORM relationship properties. To require that the relationship contain at least one related entity add the ok_required attribute to the property (ok_required="true"). To do full validation on related entities add the ok_validate attribute to the property with a value of true (ok_validate="true"). Validation is not done on properties defined as inverse (i.e. inverse="true").

Below is a sample ORM entity that does nested validation on the children property.

```
component entityname="Person" persistent="true" ok_unique="firstName,lastName" {

    property name="id" fieldtype="id" generator="native";
    property name="firstName" type="string" ormtype="string";
    property name="lastName" type="string" ormtype="string";
    property name="phone" type="string" ormtype="string" ok_isvalid="telephone";
    property name="children" singularname="child" fieldtype="one-to-many" cfc="Person" fkcolumn="parentID" ok_validate="true";
    property name="parent" fieldtype="many-to-one" cfc="Person" fkcolumn="parentID" inverse="true";

}
```

__Note:__ At this point there are no checks in place for circular references so care should be taken to avoid infinite recursion.

### Custom Rules ###

Documentation Coming Soon!

## Messages ###

Error messages are defined in the `/resources/DefaultMessages.properties` file.

### Pre-Defined Messages ###

Below are the built in message definitions:

```
length={display} must be less than {length} characters.
notnull={display} is required.
ok_assertfalse={display} is not false.
ok_asserttrue={display} is not true.
ok_future={display} is not after {ok_future}.
ok_gte={prop1} must be greater than or equal to {prop2}.
ok_inlist={display} must be one of the following values: {ok_inlist}.
ok_isvalid={display} is not a valid {ok_isvalid}.
ok_lte={prop1} must be less than or equal to {prop2}.
ok_match=The following must match: {ok_match}.
ok_matchnocase=The following must match: {ok_matchnocase}.
ok_notinlist={display} must not be one of the following values: {ok_notinlist}.
ok_password={display} is not a valid password.
ok_past={display} is not before {ok_past}.
ok_required={display} is required.
ok_unique={display} must be unique.
ormtype={display} is not of type {ormtype}.
type={display} is not of type {type}.
```

Note that tokens surrounded in braces are replaced on message generation.

### Custom Messages ###

Documentation Coming Soon!


