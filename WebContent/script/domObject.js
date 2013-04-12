function FORM(options) {
	var form = document.createElement("form");
	form.name = options.name;
	form.method = 'post';
	form.action = options.action;
	for ( var field in options.fieldsHidden) {
		var input = document.createElement("input");
		input.type = 'hidden';
		input.value = options.fieldsHidden[field];
		input.name = field;
		form.appendChild(input);
	}
	return form;
}