class Task {
  String taskName;
  bool isDone = false;
  int id;


  Task({required this.taskName, required this.id, required this.isDone});


  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'taskName': taskName,
      'isDone': isDone ? 1 : 0
    };
  }
}