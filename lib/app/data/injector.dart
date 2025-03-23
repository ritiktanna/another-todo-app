import 'package:another_todo_app/app/data/local_store_file.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static Future<void> init() async {
    GetIt.instance.registerLazySingleton<DatabaseHelper>(
      () => DatabaseHelper(),
    );
  }
}
