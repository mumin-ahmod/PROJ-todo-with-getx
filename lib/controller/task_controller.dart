
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_getx/database/firebase_helper.dart';
import 'package:todo_getx/model/task_data.dart';

class TaskController extends GetxController{

  var taskData = <TaskData>[].obs;

  late TextEditingController addTaskController;




  @override
  void onInit() {



    taskData.bindStream(FirebaseHelper.getAllTodoStream()); // stream coming from firebase

    addTaskController = TextEditingController();

    // _getData();

    super.onInit();
  }

  // void _getData() {
  //  DatabaseHelper.instance.getAllRows().then((value) {
  //    for (var element in value) {
  //      taskData.add(TaskData(id: element['id'], title: element['title']));
  //    }
  //  });
  // }
  //
  //
  // void addData() async{
  //   await DatabaseHelper.instance.insert(TaskData(title: addTaskController.text));
  //
  //
  //   taskData.insert(0, TaskData(id : taskData.length, title: addTaskController.text));
  //
  //   addTaskController.clear();
  //
  // }
  //
  // void deleteTask(int id) async {
  //   await DatabaseHelper.instance.delete(id);
  //
  //   taskData.removeWhere((element) => element.id == id);
  // }


  addTodo() async{
    var todo = TaskData(title: addTaskController.text);

    await FirebaseHelper.insertTodo(todo);

  }
  //
  // getAllTodoList() {
  //
  //
  //     FirebaseHelper.getAllTodoStream().forEach((task) => task.forEach((item) => taskData.add(item)));
  //
  //
  //
  // }


}