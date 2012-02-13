/**
 * @extends coldmvc.test.mxunit.FrameworkTestCase
 */
component {

	function setUp() {

		variables.HmacUtil = $.factory.getBean("HmacUtil");

		variables.secret = "098446F0C56A942A8268DE6E9F276DA8";

	}

	function data_input_should_be_valid_when_of_type_string() {

		var data = "foo";

		var token = HmacUtil.tokenize(data, secret);

		var valid = HmacUtil.validate(data, token, secret);

		//assertions
		assertTrue(isSimpleValue(token));
		assertTrue(valid);

	}

	function data_input_should_be_valid_when_of_type_struct() {

		var data = {foo="bar"};

		var token = HmacUtil.tokenize(data, secret);

		var valid = HmacUtil.validate(data, token, secret);

		//assertions
		assertTrue(isSimpleValue(token));
		assertTrue(valid);

	}

	function data_input_should_be_valid_when_of_type_array() {

		var data = ["foo", "bar"];

		var token = HmacUtil.tokenize(data, secret);

		var valid = HmacUtil.validate(data, token, secret);

		//assertions
		assertTrue(isSimpleValue(token));
		assertTrue(valid);

	}

}