import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/Hive/task_repository.dart';
import '../../Hive/task_model.dart' show TaskModel;

class TaskCubit extends Cubit<List<TaskModel>> {
  final TaskRepository repository;

  TaskCubit(this.repository) : super([]) {
    loadTasks();
  }

  void loadTasks() {
    emit(repository.getAll());
  }

  Future<void> addTask(TaskModel task) async {
    await repository.add(task);
    loadTasks();
  }

  Future<void> toggleTask(int index) async {
    await repository.toggle(index);
    loadTasks();
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteAt(index);
    loadTasks();
  }
}
