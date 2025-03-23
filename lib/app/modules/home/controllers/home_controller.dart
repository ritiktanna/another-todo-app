import 'package:another_todo_app/app/data/local_store_file.dart';
import 'package:another_todo_app/app/modules/home/model/task_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DatabaseHelper databaseHelper;
  RxList<Task> taskList = <Task>[].obs;
  RxBool isLoading = false.obs;

  HomeController({required this.databaseHelper});
  @override
  void onReady() {
    getTaskList();
    super.onReady();
  }

  Future<void> getTaskList() async {
    isLoading.value = true;
    taskList.value = await databaseHelper.getTasks();
    isLoading.value = false;
  }

  void deleteTask(int? id) async {
    await databaseHelper.deleteTask(id ?? 0);
    await getTaskList();
  }

  void editTask(int? id) {
    for (Task task in taskList) {
      if (task.id == id) {
        task.isCompleted.value = !(task.isCompleted.value);
        databaseHelper.updateTask(task);
      }
    }
  }
}
