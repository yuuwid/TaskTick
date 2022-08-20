part of 'task_cubit.dart';

class TaskState extends Equatable {
  dynamic taskId;

  Tasks? task;

  TaskState({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
