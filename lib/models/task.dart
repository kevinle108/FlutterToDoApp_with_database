class Task {
  final String taskName;
  bool isDone = false;
  late final int id;
  int idTracker = 0;

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