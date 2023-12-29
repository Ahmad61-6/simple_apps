import 'package:flutter/material.dart';
import 'todo.dart';
class UpdateNewTaskModal extends StatefulWidget {
  const UpdateNewTaskModal({
    super.key, required this.todo, required this.onToDoUpdate,
  });
final Todo todo;
final Function(String) onToDoUpdate;
  @override
  State<UpdateNewTaskModal> createState() => _UpdateNewTaskModalState();
}

class _UpdateNewTaskModalState extends State<UpdateNewTaskModal> {
  late final TextEditingController todoTEController = TextEditingController(text: widget.todo.details);
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
                  return 'Enter the value';
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
              widget.onToDoUpdate(todoTEController.text.trim());
              Navigator.pop(context);
            }
              },
                  child: Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }
}