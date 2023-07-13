import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:todoapp/data/controller.dart';
import 'package:todoapp/widgets/addNewTask.dart';
import 'package:todoapp/widgets/toDoItem.dart';
import 'package:todoapp/data/toDoModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _toDoController = TextEditingController();
  // final _getController = Get.find<ToDoController>();
  var jsonData;
  int toDoData= 0;
  void _getDataFromAPI() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.get(
        Uri.parse('http://localhost:1337/api/to-dos'),
        headers: headers);
    setState(() {
      jsonData = jsonDecode(response.body);
      toDoData = jsonData["meta"]["pagination"]["total"];
      print(jsonData["data"][1]["attributes"]["toDoName"]);
    });
  }

// void checkBoxChanged(bool? value, int index) {
//   setState(() {
//     toDoList[index][1] = !toDoList[index][1];
//   });
// }

// void addNewTask() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return DialogBox(
//             controller: _toDoController,
//             // onSave: saveNewTask,
//             onCancel: () => Navigator.of(context).pop(),
//           );
//         });
//   }

  // void saveNewTask() {
  //   setState(() {
  //     _getController.toDoList.add([_toDoController.text, false]);
  //     _toDoController.clear();
  //     Navigator.of(context).pop();
  //   });
  // }

  // delete task todo
  // void deleteTask(int index) {
  //   setState(() {
  //     _getController.toDoList.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // button for add new task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getDataFromAPI();
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
              itemCount: toDoData,
              itemBuilder: (data, index){
                return toDoItem(
                    // taskId: _getController.toDoList[index].id,
                    taskName: jsonData["data"][index]["attributes"]["toDoName"],
                    taskCompleted: true,
                    // onChanged: (value) => checkBoxChanged(value, index),
                    // deleteTodoItem: (context) => deleteTask(index)
                    );
              })),
    );
  }
}