import 'package:another_todo_app/app/data/assets.dart';
import 'package:another_todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:another_todo_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'widgets/task_list_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_DATA)?.then((value) async {
            if (value ?? false) {
              await controller.getTaskList();
            }
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Obx(
        () =>
            controller.taskList.isEmpty
                ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100.h),
                    child: Lottie.asset(
                      Assets.noDataLotti,
                      height: 300.w,
                      width: 300.w,
                    ),
                  ),
                )
                : Stack(
                  children: [
                    if (controller.isLoading.value) ...[
                      const Center(child: CircularProgressIndicator()),
                    ],
                    RefreshIndicator(
                      onRefresh: () async {
                        await controller.getTaskList();
                      },
                      child: ListView.builder(
                        itemBuilder:
                            (context, index) => TaskListItem(
                              task: controller.taskList[index],
                              onDeleteTap: () {
                                controller.deleteTask(
                                  controller.taskList[index].id,
                                );
                              },
                              onChanged: (value) {
                                controller.editTask(
                                  controller.taskList[index].id,
                                );
                              },
                              onTaskTap: () {
                                Get.toNamed(
                                  Routes.ADD_DATA,
                                  arguments: controller.taskList[index],
                                )?.then((value) async {
                                  if (value ?? false) {
                                    await controller.getTaskList();
                                  }
                                });
                              },
                            ),
                        itemCount: controller.taskList.length,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
