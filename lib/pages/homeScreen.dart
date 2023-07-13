import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/widgets/addNewTask.dart';
import 'package:todoapp/widgets/avatarCard.dart';
import 'package:todoapp/widgets/toDoItem.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  final _toDoController = TextEditingController();

List toDoList = [
  ["Make a Coffe", false],
  ["Make a tea", true],
];

void checkBoxChanged(bool? value, int index) {
  setState(() {
    toDoList[index][1] = !toDoList[index][1];
  });
}

void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _toDoController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_toDoController.text, false]);
      _toDoController.clear();
      Navigator.of(context).pop();
    });
  }

 // delete task todo
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // button for add new task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask();
        },
        child: Icon(Icons.add),
      ),

      // color of background
      backgroundColor: Theme.of(context).colorScheme.background,

      // appbar
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          SimpleHiddenDrawerController.of(context).open();
                        },
                        icon: Icon(
                          Icons.menu,
                        ),
                      ),
                      Container(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://cdn.discordapp.com/attachments/768289273513508906/1039700830955261952/IMG_20221024_151020.jpg'),
                          ))
                    ],
                  ),
                ),
              ],

          // todoitem
          body: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return toDoItem(
                    taskName: toDoList[index][0],
                    taskCompleted: toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteTodoItem: (context) => deleteTask(index)
                    );
              })),
    );
  }
}
