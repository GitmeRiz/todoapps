import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:todoapp/widgets/addNewTask.dart';
import 'package:todoapp/widgets/toDoItem.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List toDosList = [
    ["Ngopi his", false],
    ["Ngeteh his", false],
  ];
  final _toDoController = TextEditingController();

  // checkbox for todo done or not
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDosList[index][1] = !toDosList[index][1];
    });
  }

  // save new task todo
  void saveNewTask() {
    setState(() {
      toDosList.add([_toDoController.text, false]);
      _toDoController.clear();
      Navigator.of(context).pop();
    });
  }

// add new task todo
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

  // delete task todo
  void deleteTask(int index) {
    setState(() {
      toDosList.removeAt(index);
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              'https://cdn.discordapp.com/attachments/768289273513508906/1039700830955261952/IMG_20221024_151020.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
              ],

          // todoitem
          body: ListView.builder(
              itemCount: toDosList.length,
              itemBuilder: (context, index) {
                return toDoItem(
                    taskName: toDosList[index][0],
                    taskCompleted: toDosList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteTodoItem: (context) => deleteTask(index));
              })
          ),
    );
  }
}