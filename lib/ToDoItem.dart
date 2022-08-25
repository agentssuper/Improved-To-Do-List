import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  final String title;
  ToDoItem({required this.title});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<ToDoItem> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDone = !isDone;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: isDone ? Icon(Icons.done_outline_sharp) : SizedBox(),
        ),
      ),
    );
  }
}
