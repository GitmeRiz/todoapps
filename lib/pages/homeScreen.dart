import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:todoapp/widgets/addNewTask.dart';
import 'package:todoapp/widgets/toDoItem.dart';
import 'package:todoapp/widgets/editTask.dart';
import 'package:http/http.dart' as http;

import '../widgets/editTask.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var _toDoController = TextEditingController();
  var jsonData;
  var toDoList;

  int toDoData = 0;
  void _getDataFromAPI() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.get(Uri.parse('http://localhost:1337/api/to-dos'),
        headers: headers);
    setState(() {
      jsonData = jsonDecode(response.body);
      toDoData = jsonData["meta"]["pagination"]["total"];
    });
  }

  void postAPI() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response =
        await http.post(Uri.parse('http://localhost:1337/api/to-dos'),
            headers: headers,
            body: jsonEncode({
              "data": {
                "toDoName": _toDoController.text,
              }
            }));
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
      postAPI();
      _toDoController.clear();
      _getDataFromAPI();
      Navigator.of(context).pop();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromAPI();
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
                                'https://cdn.discordapp.com/attachments/631695642573668363/1135613271764914318/LoginScreenLogo.png'),
                          ))
                    ],
                  ),
                ),
              ],

          // todoitem
          body: ListView.builder(
              itemCount: toDoData,
              itemBuilder: (data, index) {
                deleteTaskAPI() async {
                  var id = jsonData["data"][index]["id"];
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.delete(
                      Uri.parse('http://localhost:1337/api/to-dos/$id'),
                      headers: headers);
                  _getDataFromAPI();
                }

                editAPI() async {
                  var id = jsonData["data"][index]["id"];
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.put(
                      Uri.parse('http://localhost:1337/api/to-dos/$id'),
                      headers: headers,
                      body: jsonEncode({
                        "data": {"toDoName": _toDoController.text}
                      }));
                  _getDataFromAPI();
                }

                editTheTask() {
                  setState(() {
                    editAPI();
                    _toDoController.clear();
                    Navigator.of(context).pop();
                  });
                }

                editTask() {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return EditDialogBox(
                            controller: _toDoController,
                            onEdit: editTheTask,
                            onCancelEdit: () => Navigator.of(context).pop(),
                          );
                        });
                  });
                }

                return toDoItem(
                    taskName: jsonData["data"][index]["attributes"]["toDoName"],
                    editToDoItem: (context) => editTask(),
                    deleteTodoItem: (context) => deleteTaskAPI());
              })),
    );
  }
}
