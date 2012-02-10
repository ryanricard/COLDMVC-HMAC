####A HMAC security plugin for ColdMVC

#####Usage:

Download the HMAC plugin for ColdMVC and put it inside your _/plugins_ folder. Name the directory however you like; to reduce possible conflict, I suggest namespacing it _/com-ryanricard-hmac_.

Update your app's _/config/plugins.cfm_ with the following.

	<cfset add("com-ryanricard-hmac") />

Then inject HmacUtil into a component to implement:

<code>
	property HmacUtil;
</code>

#####Available Methods:

######tokenize(data, secret)

Returns: tokenized string

* data (required): any value complex or simple
* secret (required): a secret string to be used as a hash key

######validate(data, token, secret, timeout)

Returns: true/false

* data (required): any value complex or simple
* token (required): value returned from calling tokenize on the same data
* secret (required): a secret string to be used as a hash key
* timeout (optional; default = 5): numeric value in minutes to be used as an expiry threshold from the time of the request

#####Expiry

Purpose: Limits the duration a request is valid.

Usage: To achieve heightened security with Expiry, passed data must be of datatype struct containing the key 'timestamp' and a valid datetime value.  Timestamp is included in the computation of the hash returned by _tokenize()_ thus altered timestamp will result in _validate()_ returning _false_.  Expiry uses _server-time + timeout_ (defaulted to 5 minutes) to determine the expiration of requests.



#####Copyright 2012 Ryan Ricard

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.