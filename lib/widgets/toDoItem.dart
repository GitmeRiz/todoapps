import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoItem extends StatelessWidget {
  // final int taskId;
  final String taskName;
  Function(BuildContext)? deleteTodoItem;
  Function(BuildContext)? editToDoItem;

  toDoItem(
      {super.key,
      // required this.taskId,
      required this.taskName,
      required this.deleteTodoItem,
      required this.editToDoItem
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTodoItem,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        startActionPane:
            ActionPane(motion: StretchMotion(), children: [SlidableAction(
              onPressed: editToDoItem,
              icon: Icons.edit,
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(12),
            )]),
        child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Text(
                  taskName,
                )
              ],
            )),
      ),
    );
  }
}
