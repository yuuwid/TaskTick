part of 'priority_cubit.dart';

class PriorityState extends Equatable {
  final IconData icon;
  final String text;

  PriorityState({required this.icon, required this.text});

  @override
  List<Object> get props => [icon, text];
}
