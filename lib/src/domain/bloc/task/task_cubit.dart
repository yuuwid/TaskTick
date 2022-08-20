import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasktick/src/data/models/tasks_model.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(taskId: "0"));

  onSelectTask(String taskId) {
    TaskState state = TaskState(taskId: taskId);
    state.task = TasksModel.find(taskId);
    emit(state);
  }

  onClose() {
    emit(TaskState(taskId: "0"));
  }
}
