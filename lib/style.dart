import 'package:flutter/material.dart';

InputDecoration AppInputStyle(label){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    filled: true,
    fillColor: Colors.white,
    enabledBorder:  OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.greenAccent),
    ),
    border: OutlineInputBorder(
        borderSide:  BorderSide(width: 3, color: Colors.amberAccent),
    ),
    labelText: label

  );
}


ButtonStyle AppButton(){
  return ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      padding: EdgeInsets.all(22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )
  );
}