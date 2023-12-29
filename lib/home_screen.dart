import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_new_task_modal.dart';
import 'update_new_task_modal.dart';
import 'todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    //Adding a new _todo
    addTodo(Todo todo){
      setState(() {
        todoList.add(todo);
      });

    }

    // delete _todo from list
    deleteTodo(int index){
      setState(() {
        todoList.removeAt(index);
      });

    }

    // update to do list
    updateTodo(int index, String todoDetails){
      setState(() {
        todoList[index].details = todoDetails;
      });
    }

    // update to do status pending->Done
    updateTodoStatus(int index, String newStatus){
      setState(() {
        todoList[index].status = newStatus;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          showModalBottomSheet(context: context,
              builder: (context){
            return AddNewTaskModal(
              addOnTap: (Todo todo){
                addTodo(todo);
              },
            );
          }
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: todoList.length,
          itemBuilder: (context,index){
          final Todo todo = todoList[index];
          final String formattedDate = DateFormat('hh:mm a dd-MM-yy').format(todo.createdTime);
            return ListTile(
              tileColor: todo.status == 'done' ? Colors.green : null,
              onLongPress: (){
                String currentStatus = todo.status == 'pending' ? 'done' : 'pending';
                updateTodoStatus(index, currentStatus);

              },
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Actions"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Update"),
                          onTap: (){
                            Navigator.pop(context);
                        showModalBottomSheet(context: context, builder: (context){
                          return UpdateNewTaskModal(
                            todo: todo,
                            onToDoUpdate: (String updatedToDoDetails){
                              updateTodo(index, updatedToDoDetails);
                            },
                          );
                        });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("Delete"),
                          onTap: (){
                            deleteTodo(index);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                });
              },
              leading: CircleAvatar(
                child: Text('${index+1}'),
              ),
              title:  Text(todo.details),
              subtitle:  Text(formattedDate),
              trailing:  Text(todo.status.toUpperCase()),
            );

          },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
          );
        },
      ),
    );

  }
}




