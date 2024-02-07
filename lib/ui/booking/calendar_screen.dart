import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/calendar/calendar_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/booking/widgets/hours_button.dart';
import 'package:medify/ui/tab_box/profile/widgets/select_photo.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime page = DateTime.now();
  int selectHour = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          title: "Book Real Estate",
          onTap: () {
            Navigator.pop(context);
          }),
      body: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          print("${state.startDate} checkIn");
          return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(24.r),
                  children: [
                    Text(
                      tr("select_date"),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900),
                    ),
                    20.ph,
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.blueBackground,
                          borderRadius: BorderRadius.circular(24.r)),
                      child: TableCalendar(
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        calendarStyle: const CalendarStyle(
                          outsideDaysVisible: false,
                        ),
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder: (context, DateTime focusedDay) {
                            final monthName =
                                DateFormat.MMMM(context.locale.toString())
                                    .format(focusedDay);
                            final year = DateFormat.y().format(focusedDay);
                            return Text(
                              '$monthName $year',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.c_900, // Customize the color as needed
                              ),
                            );
                          },
                          dowBuilder: (context, day) {
                            if (day.weekday == DateTime.sunday) {
                              final text =
                                  DateFormat.E(context.locale.toString())
                                      .format(day);
                              return Center(
                                child: Text(
                                  text,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.c_900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        locale: context.locale.toString(),
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2040),
                        focusedDay: state.focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(state.selectedDate, day),
                        rangeStartDay: state.startDate,
                        calendarFormat: CalendarFormat.month,
                        rangeSelectionMode: state.rangeSelectionMode,
                        onRangeSelected: (start, end, focusedDay) {
                          context
                              .read<CalendarCubit>()
                              .initializeRanges(start, start);
                          // context.read<CalendarCubit>().updateCheck(start.toString().split(" ").first, start.toString().split(" ").first);
                        },
                        onPageChanged: (v) {
                          context.read<CalendarCubit>().changeFocusDay(v);
                        },
                      ),
                    ),
                    24.ph,
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                            9,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: HoursButton(
                                index: index+1,
                                  onTap: () {
                                    selectHour = index;
                                    setState(() {

                                    });
                                  },
                                  isSelect: selectHour == index),
                            ))
                      ],
                    ),
                    24.ph,
                    Row(
                      children: [
                        GlobalButton(color: AppColors.green, textColor: Colors.white, title: "select image", onTap: (){
                          showCameraAndGalleryDialog(context, (imagePath) {
                            if (imagePath != null) {
                              // context.read<EditProfileCubit>().updateFile(imagePath);
                              print(imagePath.split(".").last);
                            }
                          });
                        }),
                        20.pw,
                        GlobalButton(color: AppColors.green, textColor: Colors.white, title: "select file", onTap: ()async{
                          _openFilePicker(context);
                        })
                      ],
                    ),
                    24.ph,
                    Text(
                      tr("note_to_owner"),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900),
                    ),
                    16.ph,
                    GlobalTextField(
                      focusNode: state.notesFocus,
                      controller: state.notes,
                      hintText: tr("notes"),
                      maxLines: 4,
                      contentPadding: EdgeInsets.all(20.r),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                  title: tr("continue"),
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.bookingInfoDetailScreen);
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
              40.ph,
            ],
          );
        },
      ),
    );
  }
  Future<void> _openFilePicker(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // File picked successfully
        print('File picked: ${result.files.first.path?.split(".").last}');
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle exception
      print('Error picking file: $e');
    }
  }
}
