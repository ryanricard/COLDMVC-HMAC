/**
 * @extends coldmvc.test.mxunit.FrameworkTestCase
 */
component {

	function setUp() {

		variables.HmacUtil = $.factory.getBean("HmacUtil");

		variables.secret = "098446F0C56A942A8268DE6E9F276DA8";

	}

	function request_should_be_valid_when_data_matches_token() {

		var data = {
			foo = "bar",
			timestamp = dateFormat(now(), "mm/dd/yyyy") & " " & timeFormat(now(), "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(data, secret);

		//assertions
		assertTrue(HmacUtil.validate(data, token, secret));

	}

	function request_should_be_invalid_when_data_does_not_match_token() {

		var data = {
			foo = "bar",
			timestamp = dateFormat(now(), "mm/dd/yyyy") & " " & timeFormat(now(), "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(data, secret);

		//changing data should result in validation to fail
		data.foo = "foo";

		//assertions
		assertFalse(HmacUtil.validate(data, token, secret));

	}

	function request_should_be_valid_when_timestamp_is_not_included_and_data_matches_token() {

		var data = {
			foo = "bar"
		};

		var token = HmacUtil.tokenize(data, secret);

		//assertions
		assertTrue(HmacUtil.validate(data, token, secret));

	}

	function request_should_be_invalid_when_timestamp_is_not_included_and_data_does_not_match_token() {

		var data = {
			foo = "bar"
		};

		var token = HmacUtil.tokenize(data, secret);

		//changing data should result in validation to fail
		data.foo = "foo";

		//assertions
		assertFalse(HmacUtil.validate(data, token, secret));

	}

}