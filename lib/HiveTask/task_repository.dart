import 'package:hive/hive.dart';
import 'package:to_do_list/HiveTask/task_model.dart';


class TaskRepository {
  final Box<TaskModel> _box = Hive.box<TaskModel>('tasksBox');

  List<TaskModel> getAll() {
    return _box.values.toList();
  }

  Future<void> add(TaskModel task) async {
    await _box.add(task);
  }

  Future<void> toggle(int index) async {
    final task = _box.getAt(index);
    if (task != null) {
      task.isDone = !task.isDone;
      await task.save();
    }
  }

  Future<void> deleteAt(int index) async {
    await _box.deleteAt(index);
  }
}
