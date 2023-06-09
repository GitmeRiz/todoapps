import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {

  List toDosList = [];

  // reference out box
  final _mybox = Hive.box('mybox');

  // run this method if opening for first time
  void createInitialData() {
    toDosList = [
      ["Make a tea", false],
      ["Make a coffe", false]
    ];
  }

  // load data from database
  void loadData() {
    toDosList = _mybox.get("TODOLIST");
  }

  // update database
  void updateDatabase() {
    _mybox.put("TODOLIST", toDosList);
  }
}