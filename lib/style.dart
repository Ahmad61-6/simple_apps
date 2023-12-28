import 'package:flutter/material.dart';



ButtonStyle appButton(){
  return ElevatedButton.styleFrom(
      shape: CircleBorder(
      ), //<-- SEE HERE
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.white70
    );

}

