import 'package:another_todo_app/app/data/local_store_file.dart';
import 'package:another_todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () =>
          HomeController(databaseHelper: GetIt.instance.get<DatabaseHelper>()),
    );
  }
}
