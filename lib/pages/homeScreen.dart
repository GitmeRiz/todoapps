import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/widgets/addNewTask.dart';
import 'package:todoapp/widgets/toDoItem.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  // reference hive box
  final _myBox = Hive.box('mybox');

  toDoDatabase db = toDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    // first time opening the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // if already exist data
      db.loadData();
    }

    super.initState();
  }

  final _toDoController = TextEditingController();

  // checkbox for task done or not
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDosList[index][1] = !db.toDosList[index][1];
    });
    db.updateDatabase();
  }

  // save new task todo
  void saveNewTask() {
    setState(() {
      db.toDosList.add([_toDoController.text, false]);
      _toDoController.clear();
      Navigator.of(context).pop();
      db.updateDatabase();
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
      db.toDosList.removeAt(index);
    });
    db.updateDatabase();
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
              itemCount: db.toDosList.length,
              itemBuilder: (context, index) {
                return toDoItem(
                    taskName: db.toDosList[index][0],
                    taskCompleted: db.toDosList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteTodoItem: (context) => deleteTask(index));
              })
          ),
    );
  }
}