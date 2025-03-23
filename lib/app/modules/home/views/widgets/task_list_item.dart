import 'package:another_todo_app/app/modules/home/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDeleteTap;
  final void Function(bool? value)? onChanged;
  final VoidCallback onTaskTap;
  const TaskListItem({
    super.key,
    required this.task,
    required this.onDeleteTap,
    required this.onChanged,
    required this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: GestureDetector(
        onTap: onTaskTap,
        child: Row(
          crossAxisAlignment:
              (task.name.length >= 100)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          children: [
            Obx(
              () => Checkbox(
                visualDensity: VisualDensity.comfortable,
                value: task.isCompleted.value,
                onChanged: onChanged,
              ),
            ),
            Obx(
              () => Expanded(
                child: Text(
                  task.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: task.isCompleted.value ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    decoration:
                        task.isCompleted.value
                            ? TextDecoration.lineThrough
                            : null,
                    decorationColor: Colors.grey,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: onDeleteTap,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
