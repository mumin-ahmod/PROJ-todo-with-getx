import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Todo List")),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                controller: _taskController.addTaskController,
                decoration: const InputDecoration(hintText: "Enter a task"),
              ),
                  )),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _taskController.addTodo();

                    _taskController.checkAllTodoList();
                    _taskController.addTaskController.clear();
                  })
            ],
          ),
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: _taskController.taskData.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Text(_taskController.taskData[index].title!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ),
              ),
              ),
          )
        ]),
    );
  }
}
