import 'package:another_todo_app/app/data/local_store_file.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../controllers/add_data_controller.dart';

class AddDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataController>(
      () => AddDataController(
        databaseHelper: GetIt.instance.get<DatabaseHelper>(),
      ),
    );
  }
}
