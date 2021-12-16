import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_getx/model/task_data.dart';

class FirebaseHelper {
  static final FirebaseFirestore fdb = FirebaseFirestore.instance;

  static Future<void> insertTodo(TaskData todo) async {
    DocumentReference doc = fdb.collection("todo").doc();

    todo.id = doc.id;

    return doc.set(todo.toMap());
  }

  static Stream<List<TaskData>> getAllTodoStream() {


    var list = fdb
        .collection("todo")
        .snapshots()
        .map((query) => query.docs.map((DocumentSnapshot document) => TaskData.fromMap(document.data())).toList());



    return list;

    // returning task data list
  }
}
