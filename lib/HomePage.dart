import 'package:flutter/material.dart';
import 'package:better_todo_list/ToDoModel.dart';
import 'package:better_todo_list/ToDoItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoModel> todos = [];
  TextEditingController todoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              //NOTE: TITLE
              Text(
                "ToDo List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: Todo List
              Expanded(
                  child: Column(
                children: todos
                    .map((item) => ToDoItem(
                          title: item.title,
                        ))
                    .toList(),
              )),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: todoController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Add what to do"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(todoController.text);
                          setState(() {
                            if (todoController.text != '') {
                              todos.add(ToDoModel(
                                  title: todoController.text, isDone: false));
                            } else {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Write something first!"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('GOT IT!'),
                                        )
                                      ],
                                    );
                                  });
                            }
                            todoController.text = "";
                          });
                        },
                        child: Icon(
                          Icons.add_box,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
