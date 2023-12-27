import 'package:flutter/material.dart';

InputDecoration appInputDecoration(label){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      hoverColor: Colors.indigo.shade200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.green,
        width: 1.5
      )
    ),
    labelText: label,
  );
}

ButtonStyle appButton(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(3))
    )
    
  );
}

SizedBox sizeBox(child){
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,
    ),
  );
}