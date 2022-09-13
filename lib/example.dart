
import 'package:networking_plus/api_response.dart';
import 'package:networking_plus/networking_plus.dart';

class MockUser{
  late String? fullName;

  MockUser({this.fullName});

  MockUser.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
  }

  toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    return data;
  }
}

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
  var getResult = await Networking.get(endPoint, query: queryParameters, headers: headers);

  // POST Request
  var user = MockUser();
  var postResult = await Networking.post(endPoint, query: queryParameters, headers: headers, body: user.toJson());

  if(postResult is Success) {

    var body = postResult.response;

    //If the response is an object
    var desiredObject = MockUser.fromJson(body);

    //If the response is a list od objects
    var resultList = postResult as List;
    var itemList= resultList.map((e) => MockUser.fromJson(e));

  } else {
    var error = postResult as Error;
    var errorCode = error.code;
    var errorMessage = error.message;
  }

}