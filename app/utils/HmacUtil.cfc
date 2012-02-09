/**
 * @singleton true
 * @accessors true
 */
component {

	/**
	 * @inject coldmvc
	 */
	property $;

	private string function hash(required any data, required string secret){

		//if data is a struct, normalize because key order is not consistent
		if(isStruct(data)){
			data = normalize(data);
		}

		if(!isJson(data)){
			data = serializeJSON(data);
		}

		//hash and return lowercased json
		return $.string.hash(lcase(data), secret);

	}

	private struct function normalize(required struct data){

		//create hashmap; java linkedHashMap is essentially a coldfusion structure with preserved key order; more info: http://bit.ly/yyMKPj
		var hashMap = createObject("java", "java.util.LinkedHashMap").init();
		var keys = structKeyArray(data);
		var key = "";

		//sort keys ascending regardless of case
		arraySort(keys, "textnocase", "asc");

		//loop sorted keys and load linkedHashMap
		for(var i = 1; i <= arrayLen(keys); i++){

			key = keys[i];

			hashMap[key] = data[key];

		}

		return hashMap;

	}

	public string function tokenize(required any data, required string secret){

		return variables.hash(data, secret);

	}

	public boolean function validate(required any data, required string token, required string secret){

		//determine if token matches tokenized data
		return token == tokenize(data, secret);

	}



}