
import 'package:networking_plus/api_response.dart';
import 'package:networking_plus/networking_plus.dart';

main() async {

  //Optional: Set base URL in start
  Networking.baseURL = "https://example.com/";

  //Optional: Headers are optional
  Networking.defaultHeaders["AppVersion"] = "v1.2.6";
  Networking.defaultHeaders["Client"] = "API Client";

  var endPoint = "api/user/data";
  var queryParameters = <String, String>{
    "UserId": "54",
    "ClassId": "BE4"
  };
  var headers = <String, String>{
    "NewHeader": "Header Value"
  };

  //GET Request
  var result = await Networking.get(endPoint, query: queryParameters, headers: headers);

  // POST Request
  //var user = MockUser();
  //var result = await Networking.post(endPoint, query: queryParameters, headers: headers, body: user.toJson());

  if(result is Success) {

    var body = result.response;

    //If the response is an object
    //var desiredObject = MyObject.fromJson(body);

    //If the response is a list od objects
    //var resultList = result as List;
    //var itemList: List<MyObject> = resultList.map((e) => MyObject.fromJson(e));

  } else {
    var error = result as Error;
    var errorCode = error.code;
    var errorMessage = error.message;
  }

}