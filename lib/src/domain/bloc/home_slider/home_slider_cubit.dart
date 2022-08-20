import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasktick/src/app/utils/day_formater.dart';

part 'home_slider_state.dart';

class HomeSliderCubit extends Cubit<HomeSliderState> {
  HomeSliderCubit()
      : super(
          HomeSliderState(
            Days.now().indexOfDay,
            DayFormater.indo(Days.now().dayName),
          ),
        );

  final days = [
    "Minggu",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
  ];

  void nextPage() {
    if (state.pageIndex < 6) {
      int index = state.pageIndex + 1;
      emit(HomeSliderState(index, days[index]));
    }
  }

  void prevPage() {
    if (state.pageIndex > 0) {
      int index = state.pageIndex - 1;
      ;
      emit(HomeSliderState(index, days[index]));
    }
  }

  void onChangePage(pageIndex) {
    emit(HomeSliderState(pageIndex, days[pageIndex]));
  }
}
