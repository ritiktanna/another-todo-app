import 'package:another_todo_app/app/common_widgets/app_button.dart';
import 'package:another_todo_app/app/common_widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  const AddDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateData ? 'Edit Your Task' : 'Add Your Task'),
        leading: GestureDetector(
          onTap: () => Get.back(result: false),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          if (controller.updateData) ...[
            IconButton(
              onPressed: () async {
                await controller.deleteData();
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w).copyWith(bottom: 14.h),
        child: CustomButton(
          text: controller.updateData ? 'EDIT' : 'ADD DATA',
          onPressed: () {
            if (controller.formKey.currentState?.validate() ?? false) {
              controller.addData();
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: CustomTextField(
                controller: controller.taskController,
                hintText: 'Add Your Task',
                maxLine: 5,
                label: 'Detail',
                validator:
                    (text) => controller.emptyValidation(text ?? '', 'Detail'),
              ),
            ),
            SizedBox(height: 14.h),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.alreadyCompleted.value =
                      !controller.alreadyCompleted.value;
                },
                child: Row(
                  children: [
                    Text(
                      'Task Already Completed?',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Checkbox(
                      value: controller.alreadyCompleted.value,
                      onChanged: (value) {
                        controller.alreadyCompleted.value = value ?? false;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
