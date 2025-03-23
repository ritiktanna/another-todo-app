import 'package:another_todo_app/app/data/local_store_file.dart';
import 'package:another_todo_app/app/data/validator.dart';
import 'package:another_todo_app/app/modules/home/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataController extends GetxController with Validator {
  final DatabaseHelper databaseHelper;
  TextEditingController taskController = TextEditingController();
  RxBool alreadyCompleted = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool updateData = false;
  int? id;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      updateData = true;
      editData(Get.arguments as Task);
    }
  }

  AddDataController({required this.databaseHelper});

  Future<void> addData() async {
    if (updateData) {
      final Task task = Task(
        id: id,
        name: taskController.text.trim(),
        isCompleted: alreadyCompleted,
      );
      await databaseHelper.updateTask(task);
    } else {
      final Task task = Task(
        name: taskController.text.trim(),
        isCompleted: alreadyCompleted,
      );
      await databaseHelper.insertTask(task);
    }
    Get.back(result: true);
  }

  Future<void> editData(Task task) async {
    id = task.id;
    taskController.text = task.name;
    alreadyCompleted.value = task.isCompleted.value;
  }

  Future<void> deleteData() async {
    databaseHelper.deleteTask(id ?? 0).then((value) {
      Get.back(result: true);
    });
  }
}
