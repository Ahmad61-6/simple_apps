import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_apps/Style/style.dart';

var PostHeader = {"Content-Type": "application/json"};

Future<List> ProductGridViewListRequest() async{
 var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");

 var response = await http.get(URL,headers: PostHeader);
 var responseCode = response.statusCode;
 var responseBody = json.decode(response.body);

 if(responseCode == 200 && responseBody['status'] == 'success'){
   SuccessToast("Request Success");
   return responseBody['data'];
 }
 else
   {
     ErrorToast("Request failed! try again");
     return [];
   }

}




Future<bool> ProductCreateRequest(FormValues) async{
  
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var response =await http.post(URL,headers: PostHeader,body: PostBody);
  var ResultCode =response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status'] == 'success'){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail!  Try again");
    return false;
  }

  
}


Future<bool> productDeleteRequest(id) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var response=await http.get(URL,headers: PostHeader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> ProductUpdateRequest(FormValues,id) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);

  var PostBody=json.encode(FormValues);

  var PostHeader={"Content-Type":"application/json"};

  var response= await  http.post(URL,headers:PostHeader,body: PostBody);

  var ResultCode=response.statusCode;

  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}
