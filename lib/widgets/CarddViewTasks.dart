import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/HiveTask/task_model.dart';
import 'package:to_do_list/cubit/TaskCubit/task_cubit.dart';
import 'package:to_do_list/widgets/Task_Item.dart';
import 'package:to_do_list/widgets/add_task.dart';


class TasksCard extends StatefulWidget {
  const TasksCard({super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, List<TaskModel>>(
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Daily Tasks',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    AddTask(
                      onTaskAdded: (title) {
                        final newTask = TaskModel(title: title, isDone: false);
                        context.read<TaskCubit>().addTask(newTask);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      // ✅ استخدم index
                      return TaskItem(
                        task: state[index], // مرر الموديل كامل
                        onTaskdeleted: () {
                          context.read<TaskCubit>().deleteTask(index);
                        },
                        onTaskToggled: () {
                          context.read<TaskCubit>().toggleTask(index);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
