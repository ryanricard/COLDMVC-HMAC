/**
 * @extends coldmvc.test.mxunit.FrameworkTestCase
 */
component {

	function setUp() {

		variables.HmacUtil = $.factory.getBean("HmacUtil");

		variables.secret1 = "hot";
		variables.secret2 = "cold";

	}

	function request_should_be_valid_when_secrets_match() {

		var data = {
			foo = "bar"
		};

		var token = HmacUtil.tokenize(data, secret1);

		//assertions
		assertTrue(HmacUtil.validate(data, token, secret1));

	}

	function request_should_be_invalid_when_secret_does_not_match() {

		var data = {
			foo = "bar"
		};

		var token = HmacUtil.tokenize(data, secret1);

		//assertions
		assertFalse(HmacUtil.validate(data, token, secret2));

	}

}