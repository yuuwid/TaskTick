part of 'home_slider_cubit.dart';

class HomeSliderState extends Equatable {
  int pageIndex = 0;
  String day;

  HomeSliderState(
    this.pageIndex,
    this.day,
  );

  @override
  List<Object> get props => [pageIndex, day];
}
