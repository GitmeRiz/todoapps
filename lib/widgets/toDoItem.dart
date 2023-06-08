import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/toDo.dart';

class toDoItem extends StatefulWidget {
  final toDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const toDoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem});

  @override
  State<toDoItem> createState() => _toDoItemState();
}

class _toDoItemState extends State<toDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: ListTile(
        onTap: () {
          widget.onToDoChanged(widget.todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Theme.of(context).colorScheme.primary,
        leading: Icon(
          widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: CupertinoColors.activeBlue,
        ),
        title: Text(
          widget.todo.toDoText!,
          style: TextStyle(
              fontSize: 16,
              decoration: widget.todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {
              widget.onDeleteItem(widget.todo.id);
            },
            icon: Icon(Icons.delete, color: Colors.white,),
            iconSize: 20,
          ),
        ),
      ),
    );
  }
}
