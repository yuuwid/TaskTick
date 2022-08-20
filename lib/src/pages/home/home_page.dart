import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/utils/day_formater.dart';
import 'package:tasktick/src/domain/bloc/home_slider/home_slider_cubit.dart';
import 'package:tasktick/src/pages/home/widgets/day_schedule_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController pageController =
      PageController(initialPage: Days.now().indexOfDay);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSliderCubit(),
      child: BlocBuilder<HomeSliderCubit, HomeSliderState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: ((state.pageIndex % 3 == 0)) ? 4 : 2,
                            backgroundColor: primaryColor,
                          ),
                          SizedBox(width: 2),
                          (state.pageIndex == 6)
                              ? SizedBox()
                              : Row(
                                  children: [
                                    CircleAvatar(
                                      radius: ((state.pageIndex == 1) ||
                                              (state.pageIndex == 4))
                                          ? 4
                                          : 2,
                                      backgroundColor: primaryColor,
                                    ),
                                    SizedBox(width: 2),
                                  ],
                                ),
                          (state.pageIndex == 6)
                              ? SizedBox()
                              : Row(
                                  children: [
                                    CircleAvatar(
                                      radius: ((state.pageIndex == 2) ||
                                              (state.pageIndex == 5))
                                          ? 4
                                          : 2,
                                      backgroundColor: primaryColor,
                                    ),
                                    SizedBox(width: 2),
                                  ],
                                ),
                          Text(
                            " |  ${state.day}",
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          (state.pageIndex != 0)
                              ? GestureDetector(
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: primaryColor,
                                    size: 21,
                                  ),
                                  onTap: () {
                                    HomeSliderCubit homeCubit =
                                        context.read<HomeSliderCubit>();
                                    homeCubit.prevPage();
                                    pageController
                                        .jumpToPage(homeCubit.state.pageIndex);
                                  },
                                )
                              : SizedBox(),
                          (state.pageIndex != 6)
                              ? SizedBox(width: 20)
                              : SizedBox(),
                          (state.pageIndex != 6)
                              ? GestureDetector(
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    color: primaryColor,
                                    size: 21,
                                  ),
                                  onTap: () {
                                    HomeSliderCubit homeCubit =
                                        context.read<HomeSliderCubit>();
                                    homeCubit.nextPage();
                                    pageController
                                        .jumpToPage(homeCubit.state.pageIndex);
                                  },
                                )
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        key: ValueKey(index),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 20,
                          ),
                          child: DayScheduleWidget(dayIndex: index),
                        ),
                      );
                    },
                    onPageChanged: (page) {
                      context.read<HomeSliderCubit>().onChangePage(page);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
