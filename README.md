# Networking Plus

A Flutter Library for calling rest APIs very easily and get rid of a lots of boiler plate code base.

## Features

1. GET Request
2. POST Request
3. PUT Request
4. DELETE Request

## Getting started

To use this networking utility just call the library static functions, and you will be able to call your REST APIs very easily. Error handling is very easy in this library. It gives you the exact error in the form of a string, so you can display it on the UI for user help.     

## Usage

To initilize it first set the base URL in the library by using below code:
```
Networking.baseURL = "https://example.com/api/v1/"
```

Moreover, you can also set default headers which will be attached to the every api call.

```dart
Networking.defaultHeaders["Content-Type"] = "application/json";
Networking.defaultHeaders["Authorization"] = "Bearer ${UserRepo.getToken()}";
```

Now call any method of library like below example:

```dart
var result = await Networking.get("user/data");
```

Result can be of two type ```Success``` or ```Error```. 

If it's a success response you can get result from it like below:
```dart
if(result is Success) {
    var body = result.response;
    
    //If the response is an object
    var desiredObject = MyObject.fromJson(body);
    
    //If the response is a list od objects
    var resultList = result as List;
    var itemList: List<MyObject> = resultList.map((e) => MyObject.fromJson(e));
} 
```

Else the result is an error then:
```dart
else {
    var error = result as Error;
    var errorCode = error.code;
    var errorMessage = error.message;
}
  ```

## Additional information

These functionalities will be part of the library soon:
1. Call Timeouts
2. SSL Certificate Verification from Unverified Issuer