import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_apps/style.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO APP',
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
  List toDoList = [];
  String item = "";
  @override
  Widget build(BuildContext context) {

    myAppOnChange(content){
        setState(() {
          item = content;
        });
    }

addItem(){
      setState(() {
        toDoList.add({'item':item});
      });
}

removeItem(index){
      setState(() {
        toDoList.removeAt(index);
      });
}
    return Scaffold(
      appBar: AppBar(title: Text('To Do list'),backgroundColor: Colors.green,),
      body: Container(
        padding: EdgeInsets.all(10),
       child: Column(
         children: [
           Expanded(
             flex: 10,
               child: Row(
                 children: [
                   Expanded(
                     flex: 70,
                     child: TextFormField(
                       onChanged: (content){myAppOnChange(content);},

                       decoration: appInputDecoration("List Item"),
                     ),
                   ),
                   SizedBox(width: 4,),
                   Expanded(
                     flex: 30,

                       child: ElevatedButton(

                     style: appButton(),
                       onPressed: (){
                       addItem();
                       },

                       child: Text("Add"))),
                 ],
               )),
           SizedBox(height: 10,),
           Expanded(
             flex: 90,
               child: ListView.builder(
                 itemCount: toDoList.length,
                   itemBuilder: (context,index){
                  return Card(
                  child: sizeBox(
                    Row(
                      children: [
                        Expanded(flex: 80,child: Text(toDoList[index]["item"].toString())),
                        Expanded(flex: 20,child: TextButton(onPressed: (){
                          removeItem(index);
                        },
                          child: Icon(Icons.delete,
                            color: Colors.green,
                          ),
                        )
                        ),
                      ],
                    )
                  ),
                  );
               }),
           ),
         ],
       ),
      ),
      
    );
  }
}

