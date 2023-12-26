import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sum app",
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String,double> formValue = {"Num1":0,"Num2":0,};
  double sum = 0;
  @override
  Widget build(BuildContext context) {

    myInputOnChange(inputKey, inputValue){
      setState(() {
        formValue.update(inputKey, (value) => double.parse(inputValue));
      });
    }

    addAllNumber(){
    setState(() {
      sum = formValue['Num1']!+formValue['Num2']!;
    });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Sum App'),),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Sum is: ${sum.toString()} ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value){
              myInputOnChange("Num1", value);
              },
              decoration: AppInputStyle("First Number"),),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value){
                myInputOnChange("Num2", value);
            },
              decoration: AppInputStyle("Second Number"),),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
                child: ElevatedButton(
                  style: AppButton(),
                    onPressed: (){
                    addAllNumber();
                    },
                    child: Text('ADD') ),

            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: AppButton(),
                onPressed: (){
                addAllNumber();
                }, child: Text("Reset"))
          ],
        ),
      ),
    );
  }
}



