import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/calendar_doctors/calendar_doctors_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/booking_doctor/widgets/hours_button.dart';
import 'package:medify/ui/tab_box/profile/widgets/select_photo.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDoctorsScreen extends StatefulWidget {
  const CalendarDoctorsScreen({super.key});

  @override
  State<CalendarDoctorsScreen> createState() => _CalendarDoctorsScreenState();
}

class _CalendarDoctorsScreenState extends State<CalendarDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          title: "Book Real Estate",
          onTap: () {
            Navigator.pop(context);
          }),
      body: BlocBuilder<CalendarDoctorsCubit, CalendarDoctorsState>(
        builder: (context, state) {
          // print("${state.startDate} checkIn");
          return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        tr("select_date"),
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c_900),
                      ),
                    ),
                    20.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: DecoratedBox(
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
                                  color: AppColors
                                      .c_900, // Customize the color as needed
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
                                .read<CalendarDoctorsCubit>()
                                .initializeRanges(start, start);
                          },
                          onPageChanged: (v) {
                            context
                                .read<CalendarDoctorsCubit>()
                                .changeFocusDay(v);
                          },
                        ),
                      ),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              9,
                              (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: HoursButton(
                                        index: index + 1,
                                        onTap: () {
                                          context
                                              .read<CalendarDoctorsCubit>()
                                              .setSelectHour(index);
                                        },
                                        isSelect: state.selectHour == index),
                                  ))
                        ],
                      ),
                    ),
                    24.ph,
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.blueGrey),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.video,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("video_conversation"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: Text(
                        "\$13.88 per 30 minutes",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_700,
                        ),
                      ),
                      trailing: state.selectCall == 1
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () {
                        context.read<CalendarDoctorsCubit>().setSelectCall(1);
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.green),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.call,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("audio_conversation"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: Text("\$10.33 per 30 minutes",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.c_700,
                          )),
                      trailing: state.selectCall == 2
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () {
                        context.read<CalendarDoctorsCubit>().setSelectCall(2);
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.purple),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.camera,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("select_image"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: state.image != null
                          ? Text(
                              state.image!.substring(state.image!.length - 15),
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c_700,
                              ),
                            )
                          : null,
                      trailing: state.image != null
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () {
                        showCameraAndGalleryDialog(context, (imagePath) {
                          if (imagePath != null) {
                            context
                                .read<CalendarDoctorsCubit>()
                                .updateImage(imagePath);
                            print(imagePath.split(".").last);
                          }
                        });
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                      leading: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.orange),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.folder,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn)),
                        ),
                      ),
                      title: Text(
                        tr("select_file"),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      subtitle: state.file != null
                          ? Text(
                              state.file!.paths.first!.split("/").last,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c_700,
                              ),
                            )
                          : null,
                      trailing: state.file != null
                          ? SvgPicture.asset(AppIcons.checked)
                          : SvgPicture.asset(AppIcons.unchecked),
                      onTap: () async {
                        context
                            .read<CalendarDoctorsCubit>()
                            .updateFile(await _openFilePicker(context));
                        setState(() {});
                      },
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        tr("note_to_owner"),
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.c_900),
                      ),
                    ),
                    16.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: GlobalTextField(
                        focusNode: state.notesFocus,
                        controller: state.notes,
                        hintText: tr("notes"),
                        maxLines: 4,
                        contentPadding: EdgeInsets.all(20.r),
                      ),
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

  Future<FilePickerResult?> _openFilePicker(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // File picked successfully
        print('File picked: ${result.files.first.path?.split(".").last}');
        return result;
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle exception
      print('Error picking file: $e');
    }
    return null;
  }
}
