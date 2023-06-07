import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:todoapp/widgets/toDoItem.dart';
import 'package:todoapp/models/toDo.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  void _handleToDoChange(toDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _addToDoItem(String ToDo) {
    setState(() {
      toDosList.add(toDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          toDoText: ToDo));
      _toDoController.clear();
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      toDosList.removeWhere((item) => item.id == id);
    });
  }

  final toDosList = toDo.toDoList();
  final _toDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
          body: Stack(
            children: [
              Expanded(
                child: ListView(children: [
                  Container(
                    padding: EdgeInsets.only( bottom: 20, left: 20),
                    child: Text(
                      "All ToDos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                    ),
                  ),
                  for (toDo todo in toDosList)
                    toDoItem(
                      todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                ]),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _toDoController,
                        decoration: InputDecoration(
                            hintText: 'What should you do?',
                            border: InputBorder.none),
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(4),
                          ),
                          onPressed: () {
                            _addToDoItem(_toDoController.text);
                          },
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 40,),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
