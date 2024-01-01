import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_apps/Style/style.dart';

Future<bool> ProductCreateRequest(FormValues) async{
  
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};
  var response =await http.post(URL,headers: PostHeader,body: PostBody);
  var ResultCode =response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status'] == 'success'){
    successToast("Request Success");
    return true;
  }
  else{
    errorToast("Request fail!  Try again");
    return false;
  }

  
}