import 'package:flutter/material.dart';
import 'package:simple_apps/todo.dart';

class AddNewTaskModal extends StatefulWidget {
  const AddNewTaskModal({
    super.key, required this.addOnTap,
  });
final Function(Todo) addOnTap;

  @override
  State<AddNewTaskModal> createState() => _AddNewTaskModalState();
}

class _AddNewTaskModalState extends State<AddNewTaskModal> {
  final TextEditingController todoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add new to do",style: Theme.of(context).textTheme.titleLarge,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close)),
              ],
            ),
            SizedBox(height: 24,),
            TextFormField(
              controller: todoTEController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter your to do here",
                enabledBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
              ),
              validator: (String? value){
                if(value?.isEmpty ?? true){
                  return "Enter a value";
                }
                else{
                  return null;
                }
              },
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  Todo todo = Todo(details: todoTEController.text.trim(),
                      createdTime: DateTime.now(),
                      updatedTime: DateTime.now());
                  widget.addOnTap(todo);
                }
                Navigator.pop(context);
              },
                  child: Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}