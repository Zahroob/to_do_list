import 'package:flutter/material.dart';
import 'package:to_do_list/Hive/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onTaskdeleted,
    required this.onTaskToggled,
  });

  final TaskModel task;
  final VoidCallback onTaskdeleted;
  final VoidCallback onTaskToggled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: task.isDone,
          onChanged: (_) => onTaskToggled(),
        ),
        Expanded(
          child: Text(
            task.title,
            style: TextStyle(
              decoration: task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: const Color.fromARGB(255, 94, 93, 93),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(
            Icons.delete,
            size: 18,
            color: Color.fromARGB(255, 94, 93, 93),
          ),
          onPressed: onTaskdeleted,
        ),
      ],
    );
  }
}
