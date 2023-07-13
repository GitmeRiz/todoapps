// import 'dart:convert';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/route_manager.dart';
// import 'package:http/http.dart' as http;
// import 'package:todoapp/data/toDoModel.dart';

// class ToDoController extends GetxController {
//   var toDoList = <toDoModel>[].obs;
//   var isLoading = true.obs;

//   getToDo() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:1337/api/to-dos'));
//     if (response.statusCode == 200) {
//       toDoModel _toDoModel = toDoModel.fromJson(jsonDecode(response.body));

//       toDoList.add(
//         toDoModel(
//           id: _toDoModel.id,
//           toDoName: _toDoModel.toDoName,
//         ),
//       );

//       isLoading.value = true;
//     } else {
//       Get.snackbar('Error Loading Data!',
//           'Server responded ${response.statusCode}:${response.reasonPhrase.toString()}');
//     }
//   }
// }