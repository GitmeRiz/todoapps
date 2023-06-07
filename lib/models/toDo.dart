class toDo {
  String? id;
  String? toDoText;
  bool isDone;
  
  toDo({
    required this.id,
    required this. toDoText,
    this.isDone = false,
  });

  static List<toDo> toDoList() {
    return [
      toDo(id: '0', toDoText: 'Mobile App 1', isDone: true),
      toDo(id: '1', toDoText: 'Mobile App 2', isDone: false),
      toDo(id: '2', toDoText: 'Mobile App 3', isDone: true),
      toDo(id: '3', toDoText: 'Mobile App 4', isDone: false),
      toDo(id: '4', toDoText: 'Mobile App 5', isDone: false),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
      toDo(id: '5', toDoText: 'Mobile App 6', isDone: true),
    ];
  }
}