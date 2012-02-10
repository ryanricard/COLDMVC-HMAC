/**
 * @extends coldmvc.test.mxunit.FrameworkTestCase
 */
component {

	function setUp() {

		variables.HmacUtil = $.factory.getBean("HmacUtil");

		variables.secret = "098446F0C56A942A8268DE6E9F276DA8";

	}

	//function name format: _should_be_[valid|invalid]_when_

	function request_should_be_valid_when_expiry_is_within_default_threshold() {

		var params = {
			foo = "bar",
			timestamp = dateFormat(now(), "mm/dd/yyyy") & " " & timeFormat(now(), "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(params, secret);

		//assertions
		assertTrue(HmacUtil.validate(params, token, secret));

	}

	function request_should_be_invalid_when_expiry_is_beyond_default_threshold() {

		var timestamp = dateAdd("n", 6, now());

		var params = {
			foo = "bar",
			timestamp = dateFormat(timestamp, "mm/dd/yyyy") & " " & timeFormat(timestamp, "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(params, secret);

		//assertions
		assertFalse(HmacUtil.validate(params, token, secret));

	}

	function request_should_be_valid_when_expiry_is_within_custom_threshold() {

		var timeout = 10;

		var params = {
			foo = "bar",
			timestamp = dateFormat(now(), "mm/dd/yyyy") & " " & timeFormat(now(), "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(params, secret);

		//assertions
		assertTrue(HmacUtil.validate(params, token, secret, timeout));

	}

	function request_should_be_invalid_when_expiry_is_beyond_custom_threshold() {

		var timeout = 10;

		var timestamp = dateAdd("n", 11, now());

		var params = {
			foo = "bar",
			timestamp = dateFormat(timestamp, "mm/dd/yyyy") & " " & timeFormat(timestamp, "HH:mm:ss")
		};

		var token = HmacUtil.tokenize(params, secret);

		//assertions
		assertFalse(HmacUtil.validate(params, token, secret, timeout));

	}

}